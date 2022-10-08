#!/usr/bin/env bash
set -e

docker_workspaces_dir="$(dirname "$(dirname "$(realpath $0)")")"

"$docker_workspaces_dir/shared/run.sh" ghidra
