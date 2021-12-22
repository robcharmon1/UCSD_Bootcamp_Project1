#!/bin/bash

cp ~/Security_scripts/backup.sh /etc/cron.weekly
cp ~/Security_scripts/update.sh /etc/cron.weekly

lynis audit system  > /tmp/lynis.system_scna.log
