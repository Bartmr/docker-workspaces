#!/usr/bin/env bash
set -e

profile_directory=~/chrome-data/Default

#
#

total_logins=$(sqlite3 ~/chrome-data/Default/'Login Data' "SELECT COUNT(*) FROM logins")
total_encrypted_logins=$(sqlite3 ~/chrome-data/Default/'Login Data' "SELECT COUNT(*) FROM logins WHERE cast(password_value AS TEXT) LIKE 'v11%'")
total_empty_logins=$(sqlite3 ~/chrome-data/Default/'Login Data' "SELECT COUNT(*) FROM logins WHERE cast(password_value AS TEXT) = ''")

if [ "$total_logins" == "0" ]
then
  echo "!!! No passwords to check !!!"
  exit 1
fi

if [ "$total_encrypted_logins" == "0" ]
then
  echo "!!! No encrypted passwords available !!!"
  exit 1
fi

total_empty_or_encrypted_logins=$(($total_encrypted_logins + $total_empty_logins))


echo "Encrypted passwords        : $total_encrypted_logins"
echo "Empty passwords            : $total_empty_logins"
echo "Empty + Encrypted passwords: $total_empty_or_encrypted_logins"
echo "Total passwords            : $total_logins"

if [ "$total_logins" != "$total_empty_or_encrypted_logins" ]
then
  echo "!!! Chrome passwords are NOT being correctly encrypted !!!"
  exit 1
fi

#
#
echo "-----"
#
#

total_cookies=$(sqlite3 ~/chrome-data/Default/'Cookies' "SELECT COUNT(*) FROM cookies")
total_encrypted_cookies=$(sqlite3 ~/chrome-data/Default/'Cookies' "SELECT COUNT(*) FROM cookies WHERE cast(encrypted_value AS TEXT) LIKE 'v11%'")
total_empty_cookies=$(sqlite3 ~/chrome-data/Default/'Cookies' "SELECT COUNT(*) FROM cookies WHERE cast(encrypted_value AS TEXT) = ''")

if [ "$total_cookies" == "0" ]
then
  echo "!!! No cookies to check !!!"
  exit 1
fi

if [ "$total_encrypted_cookies" == "0" ]
then
  echo "!!! No encrypted cookies available !!!"
  exit 1
fi

total_empty_or_encrypted_cookies=$(($total_encrypted_cookies + $total_empty_cookies))

echo "Encrypted cookies        : $total_encrypted_cookies"
echo "Empty cookies            : $total_empty_cookies"
echo "Empty + Encrypted cookies: $total_empty_or_encrypted_cookies"
echo "Total cookies            : $total_cookies"

if [ "$total_cookies" != "$total_empty_or_encrypted_cookies" ]
then
  echo "!!! Chrome cookies are NOT being correctly encrypted !!!"
  exit 1
fi
#
#

success_colors="\0033[1;30;102m"
reset_colors="\0033[0m"

echo ""
echo -e "${success_colors}Chrome data is being correctly encrypted${reset_colors}"
