# Hermes Telegram delivery regressions

Use this when Hermes produces a complete answer internally but Telegram shows a clipped message, a stale streaming preview, a duplicate final response, or a reply that lost its quoted context.

Treat this as a delivery/context pipeline problem before blaming model quality.

## Evidence first

Compare three layers for the same turn:

1. visible Telegram message and message identifier;
2. persisted assistant content in Hermes state;
3. gateway/agent logs around response completion and send/edit operations.

Do not infer from screenshots alone. Record visible length, persisted length, stream-preview state, final-send state, and any flood-control response.

## Pattern 1: persisted answer is complete, Telegram is clipped

Evidence:

- persisted assistant content ends normally;
- Telegram text is shorter;
- a rich or fresh-final path replaced the stream preview;
- the affected chat was not eligible for that path or the eligibility check lacked chat context.

Required contract:

- fresh-final eligibility receives the target chat identifier;
- chat-scoped rich-message policy is enforced consistently for send, edit, and fresh-final paths;
- missing chat context fails closed when an allowlist is configured;
- delivery is not marked complete until the platform confirms the final payload.

## Pattern 2: stale preview plus full final answer

Evidence:

- the first message is partial and may retain a streaming cursor;
- the second message is complete;
- final preview edit failed or was rate-limited;
- the normal final-send fallback correctly delivered the complete answer.

Required contract:

- do not suppress the complete fallback send when final preview delivery was not confirmed;
- after the fallback lands, delete only the tracked stale preview;
- retry cleanup only for a bounded short rate-limit interval;
- cleanup failure must never block final delivery;
- never delete the complete final response.

## Pattern 3: reply target was extracted but never reached the model

Symptoms:

- the user replies to a bot/assistant message with a short instruction;
- the adapter resolves reply metadata and quoted text;
- the model behaves as if no reply exists.

Common root cause:

- prompt context is assembled before inbound preprocessing adds ephemeral reply context.

Required ordering:

1. preprocess inbound text and resolve own-message reply context;
2. reject or normalize invalid user text;
3. append recent/reply context to the model prompt;
4. keep quoted bot/assistant content out of the persisted user turn;
5. label injected quoted content as non-user-authored.

Log reply identifiers and resolution booleans, not private quoted bodies.

## Pattern 4: progress/status noise survives a successful turn

Desired behavior:

- temporary progress, tool, and heartbeat messages may remain visible while work is running;
- after a successful final response, delete only tracked temporary messages;
- preserve final answers, user messages, media, and meaningful failure breadcrumbs;
- failed runs keep diagnostic progress when it is the only visible evidence.

## Verification

Run the smallest focused matrix for the affected layer:

```bash
python -m py_compile gateway/run.py gateway/stream_consumer.py gateway/platforms/telegram.py
python -m pytest \
  tests/gateway/test_reply_to_injection.py \
  tests/gateway/test_stream_consumer.py \
  tests/gateway/test_telegram_rich_messages.py \
  tests/gateway/test_telegram_format.py \
  -q -o 'addopts='
```

Adapt paths to the checked-out Hermes version. Missing tests should be reported, not silently skipped as proof.

Live verification requires a controlled gateway restart outside the active turn, followed by:

- API health;
- Telegram platform connected state;
- one fresh normal response;
- one direct reply to a bot/assistant message;
- no stale preview or duplicate final;
- no new delivery traceback.

## Report contract

Report:

- visible Telegram message identifier and length;
- persisted assistant length;
- classification: clipping, stale preview, duplicate final, missing reply context, or progress cleanup;
- log evidence and platform response;
- code/tests changed;
- restart and live round-trip status;
- whether any manual message cleanup occurred.

Do not include private message bodies, tokens, chat identifiers, or raw session dumps in a public incident note.
