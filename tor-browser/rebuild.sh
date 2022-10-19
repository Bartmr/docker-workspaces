#!/usr/bin/env bash
set -euo pipefail
shopt -s inherit_errexit

docker_workspaces_dir="$(dirname "$(dirname "$(realpath $0)")")"

$docker_workspaces_dir/shared/rebuild.sh tor-browser
