import test from "node:test";
import assert from "node:assert/strict";
import fs from "node:fs";
import os from "node:os";
import path from "node:path";
import { spawnSync } from "node:child_process";
import { fileURLToPath } from "node:url";

const __dirname = path.dirname(fileURLToPath(import.meta.url));
const scriptPath = path.resolve(__dirname, "../scripts/openclaw-single-gateway.sh");

function runScript(args) {
  return spawnSync("bash", [scriptPath, ...args], { encoding: "utf8" });
}

function writeFile(targetPath, content) {
  fs.mkdirSync(path.dirname(targetPath), { recursive: true });
  fs.writeFileSync(targetPath, content);
}

test("dry-run-local reports duplicate shared-state supervisors and recommends a canonical user service on 8090", () => {
  const root = fs.mkdtempSync(path.join(os.tmpdir(), "openclaw-single-gateway-"));

  writeFile(
    path.join(root, "home/chip/.config/systemd/user/openclaw-gateway.service"),
    `[Unit]
Description=OpenClaw Gateway (v2026.3.22)

[Service]
ExecStart=/usr/bin/node /home/chip/.npm-global/lib/node_modules/openclaw/dist/index.js gateway --port 8090
Environment=TELEGRAM_BOT_TOKEN=test-token
Environment=OPENCLAW_GATEWAY_PORT=8090
Environment=OPENCLAW_SERVICE_VERSION=2026.3.22

[Install]
WantedBy=default.target
`
  );

  writeFile(
    path.join(root, "etc/systemd/system/openclaw-gateway.service"),
    `[Unit]
Description=OpenClaw Gateway (run as chip)

[Service]
User=chip
Environment=OPENCLAW_STATE_DIR=/home/chip/.openclaw
Environment=CLAWDBOT_WORKSPACE=/opt/clawd-workspace
ExecStartPre=-/bin/sh -c 'pkill -9 -f openclaw-gateway 2>/dev/null || true'
ExecStart=/home/chip/.npm-global/bin/openclaw gateway --port 18789

[Install]
WantedBy=multi-user.target
`
  );

  writeFile(path.join(root, "home/chip/.openclaw/openclaw.json"), "{}\n");

  const result = runScript(["--dry-run-local", "--root", root]);

  assert.equal(result.status, 0, result.stderr);
  const report = JSON.parse(result.stdout);
  assert.equal(report.status, "drift");
  assert.equal(report.duplicateSharedState, true);
  assert.equal(report.canonicalPort, 8090);
  assert.equal(report.recommendedAction, "promote-user-service-drop-system-unit");
  assert.deepEqual(report.envKeysToMigrate, ["TELEGRAM_BOT_TOKEN"]);
});

test("apply-local rewrites the user unit to the canonical 8090 service, migrates env, and removes the system unit", () => {
  const root = fs.mkdtempSync(path.join(os.tmpdir(), "openclaw-single-gateway-"));

  writeFile(
    path.join(root, "home/chip/.config/systemd/user/openclaw-gateway.service"),
    `[Service]
ExecStart=/usr/bin/node /home/chip/.npm-global/lib/node_modules/openclaw/dist/index.js gateway --port 8090
Environment=TELEGRAM_BOT_TOKEN=test-token
Environment=OPENAI_API_KEY=test-openai
Environment=OPENCLAW_GATEWAY_PORT=8090
`
  );

  writeFile(
    path.join(root, "etc/systemd/system/openclaw-gateway.service"),
    `[Service]
User=chip
Environment=OPENCLAW_STATE_DIR=/home/chip/.openclaw
Environment=CLAWDBOT_WORKSPACE=/opt/clawd-workspace
ExecStartPre=-/bin/sh -c 'pkill -9 -f openclaw-gateway 2>/dev/null || true'
ExecStart=/home/chip/.npm-global/bin/openclaw gateway --port 18789
Restart=always
`
  );

  writeFile(path.join(root, "home/chip/.openclaw/openclaw.json"), "{}\n");

  const applyResult = runScript(["--apply-local", "--root", root]);
  assert.equal(applyResult.status, 0, applyResult.stderr);

  const validateResult = runScript(["--validate-local", "--root", root]);
  assert.equal(validateResult.status, 0, validateResult.stderr);

  const systemUnit = fs.readFileSync(
    path.join(root, "home/chip/.config/systemd/user/openclaw-gateway.service"),
    "utf8"
  );
  const envFile = fs.readFileSync(path.join(root, "home/chip/.openclaw/.env"), "utf8");

  assert.match(systemUnit, /ExecStart=\/home\/chip\/\.npm-global\/bin\/openclaw gateway --port 8090/);
  assert.match(systemUnit, /WantedBy=default.target/);
  assert.doesNotMatch(systemUnit, /ExecStartPre=.*pkill -9 -f openclaw-gateway/);
  assert.ok(!fs.existsSync(path.join(root, "etc/systemd/system/openclaw-gateway.service")));
  assert.match(envFile, /^TELEGRAM_BOT_TOKEN=test-token$/m);
  assert.match(envFile, /^OPENAI_API_KEY=test-openai$/m);
  assert.doesNotMatch(envFile, /^OPENCLAW_GATEWAY_PORT=/m);
});
