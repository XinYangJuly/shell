#!/bin/bash
file1=/mnt/mmc/test/aa
file2=/mnt/mmc/test/bb
diff $file1 $file2 > /dev/null
if [ $? == 0 ];then
echo "both file are same"
else
echo "both file are different"
fi
