#!/usr/bin/env bash
set -euo pipefail



jq ".account_info[0].email" "/home/chrome/chrome-data/Default/Preferences"

find /home/chrome/chrome-data -maxdepth 1 -type d -name "Profile *" -print0 | while read -d '' -r profile_dir
do
  jq ".account_info[0].email" "$profile_dir/Preferences"
done
