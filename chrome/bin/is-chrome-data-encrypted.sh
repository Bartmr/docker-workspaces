#!/usr/bin/env bash
set -e

section_colors="\0033[1;33;100m"
success_colors="\0033[1;30;102m"
reset_colors="\0033[0m"

this_dir=$(dirname "$(realpath $0)")

#

$this_dir/_is-chrome-data-encrypted/is-chrome-profile-encrypted.sh "/home/chrome/chrome-data/Default"

find /home/chrome/chrome-data -maxdepth 1 -type d -name "Profile *" -print0 | while read -d '' -r profile_dir
do
  echo ""

  $this_dir/_is-chrome-data-encrypted/is-chrome-profile-encrypted.sh "$profile_dir"
done

#

echo ""
echo -e "${success_colors}Chrome data is being correctly encrypted${reset_colors}"
