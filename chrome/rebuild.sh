#!/usr/bin/env bash

docker container rm chrome

set -e

docker build \
    --build-arg USER_UID=$(id -u) \
    --build-arg USER_GID=$(id -g) \
    --build-arg TZ=$(cat /etc/timezone) \
    --build-arg CACHEBUST=$(date +%s) \
    --tag chrome .
