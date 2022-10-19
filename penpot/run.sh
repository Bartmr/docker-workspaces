#!/usr/bin/env bash
set -euo pipefail
shopt -s inherit_errexit

docker-compose -p penpot -f docker-compose.yaml up