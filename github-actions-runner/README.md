# GitHub Actions Runner

## Project

[docker-github-actions-runner](https://github.com/myoung34/docker-github-actions-runner)

## Description

Self-hosted GitHub Actions runner. Registers against a single repo and can run Docker-based jobs via the host socket.

## Setup

Set these variables in Dockhand when deploying the stack:

| Variable | Description |
| --- | --- |
| `REPO_URL` | Repo to register the runner on, e.g. `https://github.com/nicobenz/homelab` |
| `ACCESS_TOKEN` | GitHub PAT with permission to register runners (`repo` for private repos, or `public_repo` + admin on the repo) |

Runner config is persisted in `./data` so the container can restart without re-registering.
