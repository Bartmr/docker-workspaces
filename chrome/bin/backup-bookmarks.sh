#!/usr/bin/env bash
set -euo pipefail


# Use [[ $# -gt 0 ]] to test existence of positional parameters.


#

mkdir -p /home/chrome/docker-data/chrome-backup/Default
cp /home/chrome/chrome-data/Default/Bookmarks /home/chrome/docker-data/chrome-backup/Default/

find /home/chrome/chrome-data -maxdepth 1 -type d -name "Profile *" -print0 | while read -d '' -r profile_dir
do
  profile_name=$(basename "${profile_dir}")

  mkdir -p "/home/chrome/docker-data/chrome-backup/${profile_name}"

  cp "/home/chrome/chrome-data/${profile_name}/Bookmarks" "/home/chrome/docker-data/chrome-backup/${profile_name}/"
done
