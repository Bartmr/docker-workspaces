#!/usr/bin/env bash
set -e

version="$(curl -s https://aus1.torproject.org/torbrowser/update_3/release/downloads.json | jq -r ".version")"
locale="en-US"

wget "https://www.torproject.org/dist/torbrowser/${version}/tor-browser-linux64-${version}_${locale}.tar.xz"

tar -xf "tor-browser-linux64-${version}_${locale}.tar.xz"

chmod +x ./tor-browser_en-US/Browser/start-tor-browser
