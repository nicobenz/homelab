# Flights

## Project

[Flight Finder](https://github.com/affromero/flight-finder)

## Description

Self-hosted flight price tracker. Scrapes Google Flights on a schedule, stores price history in Postgres, and uses an LLM to parse natural-language queries and extract fares from pages.

## Setup

Set these variables in Dockhand when deploying the stack:

| Variable | Description |
| --- | --- |
| `POSTGRES_PASSWORD` | Database password |
| `ADMIN_PASSWORD` | Admin panel login password |
| `OPENROUTER_API_KEY` | OpenRouter API key (same as mealie / open-webui) |
| `EXPRESSVPN_CODE` | ExpressVPN activation code (for VPN price comparison sidecar) |

Host must expose `/dev/net/tun` (TUN kernel module). Only Playwright scrape traffic goes through the VPN; DB, Redis, and the web UI stay on normal Docker networking.

### LLM model

Flight Finder does not read the model from compose. After deploy, open `/admin` → LLM settings:

1. Provider: **OpenAI** (uses `OPENAI_BASE_URL` + your OpenRouter key)
2. Model: any OpenRouter model ID, e.g. `google/gemini-2.5-flash` or `openai/gpt-4.1-mini`

That choice is stored in the database and used for both query parsing and price extraction.

### VPN price comparison

The `expressvpn` sidecar must be running (included in compose). In the UI, enable **Compare prices from different countries** on a tracker and pick countries to compare.

Web UI: http://localhost:3003
