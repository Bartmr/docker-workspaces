#!/usr/bin/env bash

# https://blog.jessfraz.com/post/docker-containers-on-the-desktop/

docker inspect "gimp:latest" > /dev/null 2>&1
LAST_RESULT=$?

set -e

if [ $LAST_RESULT -ne 0 ]
then
  docker build --tag gimp .
fi

mkdir -p ./data
chmod go+rw ./data

xhost +"local:docker@"

set +e

docker container inspect gimp  > /dev/null 2>&1
LAST_RESULT=$?

set -e

if [ $LAST_RESULT -ne 0 ]
then
  docker run -d \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -e DISPLAY=unix$DISPLAY \
    -v $(pwd)/data:/home/gimp/data \
    --device /dev/dri \
    --name gimp \
    gimp
else
  docker start gimp
fi
