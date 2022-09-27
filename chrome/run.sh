#!/usr/bin/env bash
set -e

docker_workspaces_dir="$(dirname "$(dirname "$(realpath $0)")")"
chrome_workspace_dir="$(dirname "$(realpath $0)")"

mkdir -p "$chrome_workspace_dir/Downloads"
chmod go+rw "$chrome_workspace_dir/Downloads"

chmod go+r ~/.config/pulse/cookie

if [ -S /tmp/pulse-socket ]
then
  echo "Previous PulseAudio socket available"
else
  echo "No PulseAudio socket available. Will create one"
  pacmd "load-module module-native-protocol-unix auth-group=audio socket=/tmp/pulse-socket"
fi

# https://developers.google.com/web/tools/puppeteer/troubleshooting#tips
# Might need to use
# --shm-size=8g
# or
# -v /dev/shm:/dev/shm
# or
# --disable-dev-shm-usage

"$docker_workspaces_dir/shared/run.sh" chrome \
    --privileged \
    --net host \
    -v "$chrome_workspace_dir/Downloads:/home/chrome/Downloads" \
    -v chrome-data:/home/chrome/chrome-data \
    -v chrome-keyring-data:/home/chrome/.local/share/keyrings \
    --volume=/tmp/pulse-socket:/tmp/pulse-socket:ro \
    -v ~/.config/pulse/cookie:/tmp/pulseaudio_cookie:ro \
    --group-add audio \
    -v /var/run/dbus/system_bus_socket:/var/run/dbus/system_bus_socket:ro \
    -v /etc/timezone:/etc/timezone:ro \
    -v /etc/localtime:/etc/localtime:ro \
    --shm-size=8g \
    --name chrome