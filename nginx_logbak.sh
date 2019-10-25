#!/bin/bash
date=`date +%Y%m%d`
logpath=`/usr/local/nginx/logs`
mv $logpath/access.log $logpath/access-$date.log
mv $logpath/access.log $logpath/error-$date.log
kill --USR1 $(cat $logpath/nginx.pid)

# kill -USR1 等于 nginx -s reopen
#这个信号量本来就是用于重新读取日志文件的
#kill -USR2 等于 nginx -s reload
#reload 和 reopen 的行为相差很大，reopen 仅仅检查日志文件，reload 会重载配置，并启动新 worker，关闭旧 worker

#crontab -e
#* * * * * bash /usr/local/nginx/logs/nginx_logbak.sh
