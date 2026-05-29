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

Web UI: http://localhost:3003
