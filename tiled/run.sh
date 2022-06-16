#!/usr/bin/env bash

# https://blog.jessfraz.com/post/docker-containers-on-the-desktop/

if [[ ! -f Tiled.AppImage ]]
then
  echo "Place the Tiled AppImage in this directory, and name it Tiled.AppImage"
  exit 1
fi

docker inspect "tiled:latest" > /dev/null 2>&1
LAST_RESULT=$?

set -e

if [ $LAST_RESULT -ne 0 ]
then
  docker build --tag tiled .
fi

mkdir -p ./data
chmod go+rw ./data


xhost +"local:docker@"

set +e

docker container inspect tiled  > /dev/null 2>&1
LAST_RESULT=$?

set -e

if [ $LAST_RESULT -ne 0 ]
then
  docker run -d \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -e DISPLAY=unix$DISPLAY \
    -v $(pwd)/data:/home/tiled/data \
    --device /dev/dri \
    --name tiled \
    tiled
else
  docker start tiled
fi
