#!/usr/bin/env bash

# https://blog.jessfraz.com/post/docker-containers-on-the-desktop/

docker inspect "ubuntu-with-gui:latest" > /dev/null 2>&1
LAST_RESULT=$?

set -e

if [ $LAST_RESULT -ne 0 ]
then
  docker build --tag ubuntu-with-gui .
fi

mkdir -p ./data
chmod go+rw ./data

xhost +"local:docker@"

set +e

docker container inspect ubuntu-with-gui  > /dev/null 2>&1
LAST_RESULT=$?

set -e

if [ $LAST_RESULT -ne 0 ]
then
  docker run -ti \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -e DISPLAY=unix$DISPLAY \
    -v $(pwd)/bin:/usr/src/app/bin \
    -v $(pwd)/data:/home/ubuntu/data \
    --device /dev/dri \
    --name ubuntu-with-gui \
    ubuntu-with-gui
else
  docker start -i ubuntu-with-gui
fi
