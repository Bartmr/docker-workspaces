#!/usr/bin/env bash
set -euo pipefail
shopt -s inherit_errexit

sudo apt-get update && sudo apt-get upgrade
