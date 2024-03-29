#!/usr/bin/env bash
set -euo pipefail


export DBUS_SYSTEM_BUS_ADDRESS=unix:path=/var/run/dbus/system_bus_socket

export DEBIAN_FRONTEND=gnome
export GNOME_SHELL_SESSION_MODE=ubuntu
export DESKTOP_SESSION=ubuntu
export XDG_SESSION_DESKTOP=ubuntu
export XDG_SESSION_TYPE=x11
export XDG_CURRENT_DESKTOP=ubuntu:GNOME
export GDMSESSION=ubuntu
export XDG_SESSION_CLASS=user

export FONTCONFIG_PATH=/etc/fonts

export TZ=$(cat /etc/timezone)

set +e
pulseaudio --start
set -e

# --- With keyring

export DBUS_SESSION_BUS_ADDRESS=$(dbus-daemon --session --print-address --fork)

eval $(gnome-keyring-daemon --start | sed -e 's/^/export /')

google-chrome --user-data-dir=/home/chrome/chrome-data
