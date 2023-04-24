#!/usr/bin/env bash
set -euo pipefail
 

docker volume list --filter dangling=true --quiet | grep -v "^bartmr-docker-workspaces" | xargs docker volume rm
