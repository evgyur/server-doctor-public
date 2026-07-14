import test from "node:test";
import assert from "node:assert/strict";
import fs from "node:fs";
import path from "node:path";
import { fileURLToPath } from "node:url";
import { spawnSync } from "node:child_process";

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);
const scriptPath = path.resolve(__dirname, "..", "scripts", "macos-single-openclaw-runtime.sh");

test("dry-run prints generic single-openclaw remediation plan", () => {
  const result = spawnSync("bash", [scriptPath, "--dry-run"], {
    encoding: "utf8"
  });

  assert.equal(result.status, 0, result.stderr);
  assert.match(result.stdout, /\/opt\/homebrew\/bin\/openclaw/);
  assert.match(result.stdout, /gateway install --force --port 8090/);
  assert.match(result.stdout, /npm uninstall -g openclaw/);
  assert.match(result.stdout, /quarantine/);
  assert.match(result.stdout, /do not leave duplicate openclaw installs/i);
});

test("apply path is Bash 3.2 compatible and cleans every nvm OpenClaw copy", () => {
  const source = fs.readFileSync(scriptPath, "utf8");

  assert.doesNotMatch(source, /\bmapfile\b|\breadarray\b/);
  assert.match(source, /while IFS= read -r nvm_node/);
  assert.match(source, /nvm_nodes\+\=\("\$nvm_node"\)/);
  assert.match(source, /for nvm_node in "\$\{nvm_nodes\[@\]\}"/);
  assert.match(source, /while IFS= read -r remaining_nvm_node/);
  assert.match(source, /remaining_nvm_nodes\+\=\("\$remaining_nvm_node"\)/);
});
