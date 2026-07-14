# Pattern: partial module extraction after merge

## Symptom

A large upstream/distribution merge compiles successfully but the service restart-loop begins with errors such as:

```text
TypeError: function() got an unexpected keyword argument '<new-argument>'
TypeError: function() missing 1 required keyword-only argument: '<dependency>'
AttributeError: object has no attribute '<helper>'
```

Fixing the first traceback reveals another mismatch in a neighboring extracted module.

## Root cause

Call sites, tests, or wrapper modules were updated, but one side of an extraction boundary was resolved from an older branch version. The caller and callee no longer share the same signature or helper contract.

Static compilation cannot detect this class because both modules remain syntactically valid.

## Recovery

1. Stop repeated blind restarts and preserve the first complete traceback.
2. Search both symbol definitions and every call site.
3. Use history search to find the commit that introduced the new parameter/helper.
4. Restore the smallest missing signature, forwarding path, field, or compatibility shim.
5. Inspect adjacent extracted boundaries before restarting; one dropped helper often predicts more.
6. Reset failed service-manager limits only after focused tests pass.

## Verification

Run more than syntax checks:

```bash
python -m py_compile <affected-modules>
python -m <cli-module> <affected-command> --help
python -m pytest <focused-parser-tests> <focused-runtime-tests> -q -o 'addopts='
```

Then verify service stability, API health, platform connection state, and one end-to-end request.

## Guardrail

For extracted CLI, gateway, session, and conversation-loop modules, keep tests that instantiate or invoke the public boundary with the current full argument set. A merge gate should combine:

- import/CLI smoke;
- focused runtime tests;
- symbol-presence checks only as a supplement;
- conflict-marker scan;
- post-restart health and user-path verification.

Do not publish private incident hosts, commit IDs, repositories, or transport targets. Preserve only the reusable failure pattern.
