#!/usr/bin/env bash
set -e

profile_directory=~/chrome-data/Default

last_modified_password=$(sqlite3 ~/chrome-data/Default/'Login Data' "SELECT password_value FROM logins ORDER BY date_password_modified DESC LIMIT 1;")

if [[ "$last_modified_password" != v11* ]]
then
  echo "!!! Chrome passwords are NOT being correctly encrypted !!!"
  exit 1
fi

last_modified_cookie=$(sqlite3 ~/chrome-data/Default/'Cookies' "SELECT encrypted_value FROM cookies ORDER BY last_update_utc DESC LIMIT 1;")

if [[ "$last_modified_cookie" != v11* ]]
then
  echo "!!! Chrome cookies are NOT being correctly encrypted !!!"
  exit 1
fi

success_colors="\0033[1;30;102m"
reset_colors="\0033[0m"

echo -e "${success_colors}Chrome data is being correctly encrypted${reset_colors}"
