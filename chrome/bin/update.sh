#!/usr/bin/env bash
set -euo pipefail


apt-mark hold tzdata

apt-get update && sudo apt-get upgrade -y

apt-mark unhold tzdata
