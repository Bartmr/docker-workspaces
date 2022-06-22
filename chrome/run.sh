#!/usr/bin/env bash

# https://blog.jessfraz.com/post/docker-containers-on-the-desktop/

docker inspect "chrome:latest" > /dev/null 2>&1
LAST_RESULT=$?

set -e

if [ $LAST_RESULT -ne 0 ]
then
  docker build --tag chrome .
fi

mkdir -p ./data
chmod go+rw ./data

xhost +"local:docker@"

set +e

docker container inspect chrome  > /dev/null 2>&1
LAST_RESULT=$?

set -e

if [ $LAST_RESULT -ne 0 ]
then
  # https://developers.google.com/web/tools/puppeteer/troubleshooting#tips
  # Might need to use
  # --shm-size=8g
  # or
  # -v /dev/shm:/dev/shm
  # or
  # --disable-dev-shm-usage

  docker run -d \
    --net host \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -e DISPLAY=unix$DISPLAY \
    -v $(pwd)/data:/home/chrome/data \
    -v /home/chrome/chrome-data \
    --device /dev/snd \
    --device /dev/dri \
    --shm-size=8g \
    --name chrome \
    chrome
else
  docker start chrome
fi
