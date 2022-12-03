#!/usr/bin/env bash
set -euo pipefail
shopt -s inherit_errexit

apt-mark hold tzdata

apt-get update && sudo apt-get upgrade -y

apt-mark unhold tzdata
