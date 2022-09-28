#!/usr/bin/env bash

name=$1

docker container rm "bartmr-docker-workspaces-$name"

set -e 
  
docker build \
  --build-arg USER_UID=$(id -u) \
  --build-arg USER_GID=$(id -g) \
  --build-arg TZ=$(cat /etc/timezone) \
  --build-arg CACHEBUST=$(date +%s) \
  --tag "bartmr-docker-workspaces/$name" "../$name"
