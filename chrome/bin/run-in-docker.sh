#!/usr/bin/env bash

set -e

export DBUS_SYSTEM_BUS_ADDRESS=unix:path=/var/run/dbus/system_bus_socket

export DBUS_SESSION_BUS_ADDRESS=$(dbus-daemon --session --print-address --fork)

export DEBIAN_FRONTEND=gnome
export GNOME_SHELL_SESSION_MODE=ubuntu
export DESKTOP_SESSION=ubuntu
export XDG_SESSION_DESKTOP=ubuntu
export XDG_SESSION_TYPE=x11
export XDG_CURRENT_DESKTOP=ubuntu:GNOME
export GDMSESSION=ubuntu
export XDG_SESSION_CLASS=user

gnome-keyring-daemon --start --components=pkcs11,secrets,ssh,gpg

google-chrome --user-data-dir=/home/chrome/chrome-data
