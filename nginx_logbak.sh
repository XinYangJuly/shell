#!/bin/bash
date=`date +%Y%m%d`
logpath=`/usr/local/nginx/logs`
mv $logpath/access.log $logpath/access-$date.log
mv $logpath/access.log $logpath/error-$date.log
kill -USR1 $(cat $logpath/nginx.pid)

crontab -e
* * * * * bash /usr/local/nginx/logs/nginx_logbak.sh
