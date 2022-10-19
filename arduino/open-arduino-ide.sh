#!/usr/bin/env bash
set -euo pipefail
shopt -s inherit_errexit

/home/arduino/squashfs-root/arduino-ide --no-sandbox
