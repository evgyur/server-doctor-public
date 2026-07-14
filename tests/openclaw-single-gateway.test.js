import test from "node:test";
import assert from "node:assert/strict";
import fs from "node:fs";
import os from "node:os";
import path from "node:path";
import { spawnSync } from "node:child_process";
import { fileURLToPath } from "node:url";

const __dirname = path.dirname(fileURLToPath(import.meta.url));
const scriptPath = path.resolve(__dirname, "../scripts/openclaw-single-gateway.sh");
const runtimeUser = ["runtime", "user"].join("-");
const runtimeHome = "/" + ["home", runtimeUser].join("/");
const openclawBin = path.posix.join(runtimeHome, ".npm-global/bin/openclaw");

function runScript(args, extraEnv = {}) {
  return spawnSync(
    "bash",
    [
      scriptPath,
      ...args,
      "--runtime-user",
      runtimeUser,
      "--runtime-home",
      runtimeHome,
      "--openclaw-bin",
      openclawBin,
    ],
    { encoding: "utf8", env: { ...process.env, ...extraEnv } }
  );
}

function writeFile(targetPath, content) {
  fs.mkdirSync(path.dirname(targetPath), { recursive: true });
  fs.writeFileSync(targetPath, content);
}

function rooted(root, absolutePath) {
  return path.join(root, absolutePath.slice(1));
}

test("remote modes require an explicit runtime user", () => {
  const result = spawnSync("bash", [scriptPath, "--dry-run", "--host", "example-host"], {
    encoding: "utf8",
  });
  assert.notEqual(result.status, 0);
  assert.match(result.stderr, /--runtime-user is required/);
});

test("remote modes reject option-shaped hosts before invoking ssh", () => {
  const result = runScript(["--dry-run", "--host", "-oProxyCommand=unexpected"]);
  assert.notEqual(result.status, 0);
  assert.match(result.stderr, /invalid --host/);
});

test("remote apply writes the user unit before stopping the system service and restarts it", () => {
  const fakeBin = fs.mkdtempSync(path.join(os.tmpdir(), "openclaw-single-gateway-bin-"));
  const fakeSsh = path.join(fakeBin, "ssh");
  fs.writeFileSync(fakeSsh, '#!/bin/sh\nprintf "%s\\n" "$2"\ncat >/dev/null\n');
  fs.chmodSync(fakeSsh, 0o755);

  const result = runScript(
    ["--apply", "--host", "example-host"],
    { PATH: `${fakeBin}:${process.env.PATH}` }
  );
  assert.equal(result.status, 0, result.stderr);
  const applyIndex = result.stdout.indexOf("--apply-local");
  const stopIndex = result.stdout.indexOf("systemctl disable --now");
  const restartIndex = result.stdout.indexOf("systemctl --user restart");
  assert.ok(applyIndex >= 0, result.stdout);
  assert.ok(stopIndex > applyIndex, result.stdout);
  assert.ok(restartIndex > stopIndex, result.stdout);
});

test("dry-run-local reports duplicate shared-state supervisors", () => {
  const root = fs.mkdtempSync(path.join(os.tmpdir(), "openclaw-single-gateway-"));
  const stateDir = path.posix.join(runtimeHome, ".openclaw");
  writeFile(
    rooted(root, path.posix.join(runtimeHome, ".config/systemd/user/openclaw-gateway.service")),
    `[Unit]\nDescription=OpenClaw Gateway\n\n[Service]\nExecStart=${openclawBin} gateway --port 8090\nEnvironment=TELEGRAM_BOT_TOKEN=test-token\n`
  );
  writeFile(
    path.join(root, "etc/systemd/system/openclaw-gateway.service"),
    `[Service]\nUser=${runtimeUser}\nEnvironment=OPENCLAW_STATE_DIR=${stateDir}\nExecStartPre=-/bin/sh -c 'pkill -9 -f openclaw-gateway 2>/dev/null || true'\nExecStart=${openclawBin} gateway --port 18789\n`
  );

  const result = runScript(["--dry-run-local", "--root", root]);
  assert.equal(result.status, 0, result.stderr);
  const report = JSON.parse(result.stdout);
  assert.equal(report.status, "drift");
  assert.equal(report.runtimeUser, runtimeUser);
  assert.equal(report.duplicateSharedState, true);
  assert.equal(report.recommendedAction, "promote-user-service-drop-system-unit");
  assert.deepEqual(report.envKeysToMigrate, ["TELEGRAM_BOT_TOKEN"]);
});

test("apply-local writes a parameterized user unit, migrates env, and removes system unit", () => {
  const root = fs.mkdtempSync(path.join(os.tmpdir(), "openclaw-single-gateway-"));
  const stateDir = path.posix.join(runtimeHome, ".openclaw");
  const userUnit = rooted(
    root,
    path.posix.join(runtimeHome, ".config/systemd/user/openclaw-gateway.service")
  );
  const systemUnit = path.join(root, "etc/systemd/system/openclaw-gateway.service");
  writeFile(
    userUnit,
    `[Service]\nExecStart=${openclawBin} gateway --port 8090\nEnvironment=TELEGRAM_BOT_TOKEN=test-token\nEnvironment=OPENAI_API_KEY=test-openai\n`
  );
  writeFile(
    systemUnit,
    `[Service]\nUser=${runtimeUser}\nEnvironment=OPENCLAW_STATE_DIR=${stateDir}\nExecStartPre=-/bin/sh -c 'pkill -9 -f openclaw-gateway 2>/dev/null || true'\nExecStart=${openclawBin} gateway --port 18789\n`
  );

  const applyResult = runScript(["--apply-local", "--root", root]);
  assert.equal(applyResult.status, 0, applyResult.stderr);
  const validateResult = runScript(["--validate-local", "--root", root]);
  assert.equal(validateResult.status, 0, validateResult.stderr);

  const unitText = fs.readFileSync(userUnit, "utf8");
  const envFile = fs.readFileSync(rooted(root, path.posix.join(stateDir, ".env")), "utf8");
  assert.match(unitText, new RegExp(`ExecStart=${openclawBin.replaceAll("/", "\\/")} gateway --port 8090`));
  assert.match(unitText, /EnvironmentFile=-/);
  assert.match(unitText, /WantedBy=default.target/);
  assert.doesNotMatch(unitText, /ExecStartPre=.*pkill -9 -f openclaw-gateway/);
  assert.ok(!fs.existsSync(systemUnit));
  assert.match(envFile, /^TELEGRAM_BOT_TOKEN=test-token$/m);
  assert.match(envFile, /^OPENAI_API_KEY=test-openai$/m);
});
