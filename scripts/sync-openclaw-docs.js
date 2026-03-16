#!/usr/bin/env node

import path from "node:path";
import { fileURLToPath } from "node:url";

import { materializeSource, syncSource } from "../tools/chip-docs-local/src/index.js";

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);
const repoRoot = path.resolve(__dirname, "..");
const sourcePath = path.join(repoRoot, "sources", "openclaw.yaml");
const targetRoot = path.join(repoRoot, "references", "openclaw-docs");

async function main() {
  const syncResult = await syncSource({
    idOrPath: sourcePath
  });

  const materializeResult = await materializeSource({
    idOrPath: sourcePath,
    targetRoot
  });

  console.log(
    JSON.stringify(
      {
        sourceId: syncResult.sourceId,
        strategy: syncResult.strategy,
        changed: syncResult.changed,
        fileCount: syncResult.fileCount,
        targetRoot: materializeResult.targetRoot
      },
      null,
      2
    )
  );
}

main().catch((error) => {
  console.error(error?.stack || String(error));
  process.exitCode = 1;
});
