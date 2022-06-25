#!/usr/bin/env bash

# https://blog.jessfraz.com/post/docker-containers-on-the-desktop/

docker inspect "inkscape:latest" > /dev/null 2>&1
LAST_RESULT=$?

set -e

if [ $LAST_RESULT -ne 0 ]
then
  docker build --tag inkscape .
fi

mkdir -p ./data
chmod go+rw ./data

xhost +"local:docker@"

set +e

docker container inspect inkscape  > /dev/null 2>&1
LAST_RESULT=$?

set -e

if [ $LAST_RESULT -ne 0 ]
then
  docker run -d \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -e DISPLAY=unix$DISPLAY \
    -v $(pwd)/data:/home/inkscape/data \
    --device /dev/dri \
    --name inkscape \
    inkscape
else
  docker start inkscape
fi
