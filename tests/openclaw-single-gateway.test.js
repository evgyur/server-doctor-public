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
      "--runtime-user",
      runtimeUser,
      "--runtime-home",
      runtimeHome,
      "--openclaw-bin",
      openclawBin,
      ...args,
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
  assert.doesNotMatch(result.stdout, /chown -R/);
});

test("remote validation preserves an inner nonzero exit", () => {
  const fakeBin = fs.mkdtempSync(path.join(os.tmpdir(), "openclaw-single-gateway-remote-"));
  const fakeSsh = path.join(fakeBin, "ssh");
  const fakeSudo = path.join(fakeBin, "sudo");
  const fakeSystemctl = path.join(fakeBin, "systemctl");
  fs.writeFileSync(fakeSsh, '#!/bin/sh\nshift\nexec /bin/sh -c "$1"\n');
  fs.writeFileSync(
    fakeSudo,
    '#!/bin/sh\nwhile [ "$1" = "-u" ] || [ "$1" = "-H" ]; do if [ "$1" = "-u" ]; then shift 2; else shift; fi; done\nexec "$@"\n'
  );
  fs.writeFileSync(fakeSystemctl, "#!/bin/sh\nexit 0\n");
  for (const item of [fakeSsh, fakeSudo, fakeSystemctl]) fs.chmodSync(item, 0o755);

  const result = runScript(
    ["--validate", "--host", "example-host"],
    { PATH: `${fakeBin}:${process.env.PATH}` }
  );
  assert.notEqual(result.status, 0, result.stdout + result.stderr);
});

test("remote validation rejects a live ExecStart with extra arguments", () => {
  const fakeBin = fs.mkdtempSync(path.join(os.tmpdir(), "openclaw-single-gateway-live-"));
  const fakeSsh = path.join(fakeBin, "ssh");
  const fakeSudo = path.join(fakeBin, "sudo");
  const fakeSystemctl = path.join(fakeBin, "systemctl");
  const fakeId = path.join(fakeBin, "id");
  fs.writeFileSync(fakeSsh, '#!/bin/sh\nshift\nexec /bin/sh -c "$1"\n');
  fs.writeFileSync(
    fakeSudo,
    '#!/bin/sh\ncase "$1" in /tmp/openclaw-single-gateway.sh.*) exit 0;; esac\nwhile [ "$1" = "-u" ] || [ "$1" = "-H" ]; do if [ "$1" = "-u" ]; then shift 2; else shift; fi; done\nexec "$@"\n'
  );
  fs.writeFileSync(
    fakeSystemctl,
    `#!/bin/sh\ncase "$*" in *"is-active"*) exit 0;; *"ExecStart"*) printf "%s\\n" "argv[]=${openclawBin} gateway --port 8090 ; argv[]=/bin/sh -c unexpected ;";; *"FragmentPath"*) printf "%s\\n" "${runtimeHome}/.config/systemd/user/openclaw-gateway.service";; esac\nexit 0\n`
  );
  fs.writeFileSync(fakeId, "#!/bin/sh\nprintf '1000\\n'\n");
  for (const item of [fakeSsh, fakeSudo, fakeSystemctl, fakeId]) fs.chmodSync(item, 0o755);

  const result = runScript(
    ["--validate", "--host", "example-host"],
    { PATH: `${fakeBin}:${process.env.PATH}` }
  );
  assert.notEqual(result.status, 0, result.stdout + result.stderr);
});

test("local apply rejects path traversal outside root", () => {
  const root = fs.mkdtempSync(path.join(os.tmpdir(), "openclaw-single-gateway-root-"));
  const escapeName = `openclaw-escape-${process.pid}-${Date.now()}`;
  const escaped = path.join(path.dirname(root), escapeName);
  const result = spawnSync(
    "bash",
    [scriptPath, "--apply-local", "--root", root, "--runtime-user", runtimeUser,
      "--runtime-home", `/../${escapeName}`, "--openclaw-bin", "/usr/bin/true"],
    { encoding: "utf8" }
  );
  assert.notEqual(result.status, 0, result.stdout + result.stderr);
  assert.equal(fs.existsSync(escaped), false);
});

test("local apply rejects symlink escape outside root", () => {
  const root = fs.mkdtempSync(path.join(os.tmpdir(), "openclaw-single-gateway-root-"));
  const outside = fs.mkdtempSync(path.join(os.tmpdir(), "openclaw-single-gateway-outside-"));
  fs.symlinkSync(outside, path.join(root, "home"));
  const result = runScript(["--apply-local", "--root", root]);
  assert.notEqual(result.status, 0, result.stdout + result.stderr);
  assert.equal(fs.existsSync(path.join(outside, runtimeUser, ".config")), false);
});

test("local apply rejects nested symlink escape outside root", () => {
  const root = fs.mkdtempSync(path.join(os.tmpdir(), "openclaw-single-gateway-root-"));
  const home = path.join(root, "home", runtimeUser);
  const outside = fs.mkdtempSync(path.join(os.tmpdir(), "openclaw-single-gateway-outside-"));
  fs.mkdirSync(home, { recursive: true });
  fs.symlinkSync(outside, path.join(home, ".config"));
  const result = runScript(["--apply-local", "--root", root]);
  assert.notEqual(result.status, 0, result.stdout + result.stderr);
  assert.equal(fs.existsSync(path.join(outside, "systemd")), false);
});

test("unsafe unit values and out-of-range ports are rejected", () => {
  const root = fs.mkdtempSync(path.join(os.tmpdir(), "openclaw-single-gateway-root-"));
  const unsafeHome = "/" + ["home", "runtime user"].join("/");
  for (const args of [
    ["--runtime-home", unsafeHome],
    ["--openclaw-bin", "/usr/bin/true\nEnvironment=INJECTED=yes"],
    ["--gateway-port", "0"],
    ["--gateway-port", "65536"],
  ]) {
    const result = runScript(["--dry-run-local", "--root", root, ...args]);
    assert.notEqual(result.status, 0, `${args.join(" ")} unexpectedly passed`);
  }
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
