#!/usr/bin/env bash
set -euo pipefail

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
helper="$repo_root/scripts/openclaw-post-update-transport-hotfix.sh"

tmpdir="$(mktemp -d)"
trap 'rm -rf "$tmpdir"' EXIT

dist_dir="$tmpdir/openclaw/dist"
mkdir -p "$dist_dir/plugin-sdk"

cat > "$dist_dir/fetch-test.js" <<'EOF'
function buildTelegramConnectOptions(params) {
	if (params.family) {
		return {
			family: params.family
		};
	} else if (typeof params.autoSelectFamily === boolean) {
		return {
			autoSelectFamily: params.autoSelectFamily
		};
	}
	return {};
}
EOF

cat > "$dist_dir/fetch-connect-test.js" <<'EOF'
function buildTelegramConnectOptions(params) {
	const connect = {};
	if (params.forceIpv4) {
		connect.family = 4;
		connect.autoSelectFamily = false;
	} else if (typeof params.autoSelectFamily === "boolean") {
		connect.autoSelectFamily = params.autoSelectFamily;
		connect.autoSelectFamilyAttemptTimeout = 250;
	}
	return Object.keys(connect).length > 0 ? connect : null;
}
EOF

cat > "$dist_dir/reply-test.js" <<'EOF'
function extractTelegramApiMethod(input) {
	return "getUpdates";
}

function buildAbortSignal(params) {
	const { timeoutMs, signal } = params;
	if (!timeoutMs && !signal) return {
		signal: void 0,
		cleanup: () => {}
	};
	const controller = new AbortController();
	const timeoutId = setTimeout(controller.abort.bind(controller), timeoutMs);
	const onAbort = () => controller.abort();
	if (signal) if (signal.aborted) controller.abort();
	else signal.addEventListener("abort", onAbort, { once: true });
	return {
		signal: controller.signal,
		cleanup: () => {
			clearTimeout(timeoutId);
			if (signal) signal.removeEventListener("abort", onAbort);
		}
	};
}

function wrapTelegramFetch(opts, finalFetch) {
	if (opts.fetchAbortSignal) {
		const baseFetch = finalFetch ?? globalThis.fetch;
		const shutdownSignal = opts.fetchAbortSignal;
		const callFetch = baseFetch;
		finalFetch = ((input, init) => {
			const controller = new AbortController();
			const abortWith = (signal) => controller.abort(signal.reason);
			const onShutdown = () => abortWith(shutdownSignal);
			let onRequestAbort;
			if (shutdownSignal.aborted) abortWith(shutdownSignal);
			else shutdownSignal.addEventListener("abort", onShutdown, { once: true });
			if (init?.signal) if (init.signal.aborted) abortWith(init.signal);
			else {
				onRequestAbort = () => abortWith(init.signal);
				init.signal.addEventListener("abort", onRequestAbort);
			}
			return callFetch(input, {
				...init,
				signal: controller.signal
			}).finally(() => {
				shutdownSignal.removeEventListener("abort", onShutdown);
				if (init?.signal && onRequestAbort) init.signal.removeEventListener("abort", onRequestAbort);
			});
		});
	}
	return finalFetch;
}
EOF

"$helper" --apply-local --root "$tmpdir/openclaw"

grep -Fq 'keepAlive: true' "$dist_dir/fetch-test.js"
grep -Fq 'keepAliveInitialDelay: 3e4' "$dist_dir/fetch-test.js"
grep -Fq 'typeof params.autoSelectFamily === "boolean"' "$dist_dir/fetch-test.js"
grep -Fq 'connect.keepAlive = true;' "$dist_dir/fetch-connect-test.js"
grep -Fq 'connect.keepAliveInitialDelay = 3e4;' "$dist_dir/fetch-connect-test.js"

grep -Fq 'const method = extractTelegramApiMethod(input);' "$dist_dir/reply-test.js"
grep -Fq 'const shouldAbortOnShutdown = method === "getUpdates";' "$dist_dir/reply-test.js"
grep -Fq 'if (shouldAbortOnShutdown) {' "$dist_dir/reply-test.js"
grep -Fq 'finalFetch = ((input, init) => {' "$dist_dir/reply-test.js"
awk '
  /function buildAbortSignal/ { in_abort = 1 }
  in_abort && /function wrapTelegramFetch/ { in_abort = 0 }
  in_abort && /shouldAbortOnShutdown|extractTelegramApiMethod\(input\)/ { exit 1 }
  END { exit 0 }
' "$dist_dir/reply-test.js"
python3 - "$dist_dir/reply-test.js" <<'PY'
from pathlib import Path
import sys

text = Path(sys.argv[1]).read_text()
wrapper_pos = text.index('finalFetch = ((input, init) => {')
method_pos = text.index('const method = extractTelegramApiMethod(input);')
assert method_pos > wrapper_pos
PY

"$helper" --apply-local --root "$tmpdir/openclaw"

grep -Fq 'keepAliveInitialDelay: 3e4' "$dist_dir/fetch-test.js"
grep -Fq 'connect.keepAliveInitialDelay = 3e4;' "$dist_dir/fetch-connect-test.js"
grep -Fq 'const shouldAbortOnShutdown = method === "getUpdates";' "$dist_dir/reply-test.js"

echo "ok"
