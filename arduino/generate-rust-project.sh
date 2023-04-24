#!/usr/bin/env bash
set -euo pipefail


cargo generate --git https://github.com/Rahix/avr-hal-template.git --destination /workspaces/docker-workspaces/arduino/data --name rust
