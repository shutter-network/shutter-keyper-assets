#!/usr/bin/env ash
set -e

# Make sure the healthcheck marker file doesn't exist in case we're being restarted instead of recreated
rm -f /started

echo -e "Shutter assets version \033[0;32m$(cat /assets-source/version)"
rsync -aq --delete /assets-source/ /assets/
echo -e "\033[0;34mSleeping forever, press Ctrl+C to exit"

touch /started
sleep infinity
