#!/bin/bash

SHASUM1=$(shasum /etc/crontab | awk '{ print $1 }')
SHASUM2=$(shasum /root/scripts/cronfile/crontab | awk '{ print $1 }')

if [ "$SHASUM1" != "$SHASUM2" ] ; then
	echo "CRON WAS UPDATED" | sendmail -v higlyman@gmail.com
	cp /etc/crontab /root/scripts/cronfile/crontab
fi
exit 0
