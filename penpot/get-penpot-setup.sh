#!/usr/bin/env bash
set -euo pipefail
shopt -s inherit_errexit

cd $(dirname $0)

wget https://raw.githubusercontent.com/penpot/penpot/main/docker/images/docker-compose.yaml
wget https://raw.githubusercontent.com/penpot/penpot/main/docker/images/config.env
