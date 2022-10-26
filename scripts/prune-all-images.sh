#!/usr/bin/env bash
set -euo pipefail
shopt -s inherit_errexit

# Use [[ $# -gt 0 ]] to test existence of positional parameters.

all_containers=$(docker container ls --all --format '{{.Names}}')

for container in ${all_containers[@]}
do
  docker container stop $container
  docker container rm $container
done

docker image prune --all
