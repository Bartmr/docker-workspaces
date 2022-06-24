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
    --privileged \
    --net host \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -e DISPLAY=unix$DISPLAY \
    -v $(pwd)/bin:/usr/src/app/bin \
    -v $(pwd)/data:/home/chrome/data \
    -v chrome-data:/home/chrome/chrome-data \
    -v chrome-keyring-data:/home/chrome/.local/share/keyrings \
    --device /dev/snd \
    --volume=/run/user/$(id -u)/pulse:/run/user/999/pulse \
    --device /dev/dri \
    -v /var/run/dbus/system_bus_socket:/var/run/dbus/system_bus_socket \
    --shm-size=8g \
    --name chrome \
    chrome
else
  docker start chrome
fi
