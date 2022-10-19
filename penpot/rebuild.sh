#!/usr/bin/env bash
set -euo pipefail
shopt -s inherit_errexit

docker-compose -f docker-compose.yaml pull