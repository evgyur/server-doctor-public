import test from "node:test";
import assert from "node:assert/strict";
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
  assert.match(result.stdout, /do not leave duplicate openclaw installs/i);
});

test("apply path is designed to clean every nvm openclaw copy", () => {
  const source = spawnSync("sed", ["-n", "1,260p", scriptPath], {
    encoding: "utf8"
  });

  assert.equal(source.status, 0, source.stderr);
  assert.match(source.stdout, /mapfile -t nvm_nodes/);
  assert.match(source.stdout, /for nvm_node in "\$\{nvm_nodes\[@\]\}"/);
  assert.match(source.stdout, /mapfile -t remaining_nvm_nodes/);
});
