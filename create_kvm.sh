#!/bin/bash
read -p "请输入你要创建的虚拟机号码:" num
expect << EOF
spawn clone-vm7
expect "number: " {send "$num\r"}
expect "#"	{send "exit\r"}
EOF
if [ $? -eq 0 ];then
virsh start tedu_node$num
sleep 15
read -p "网卡 0 1 2 3:"  w
read -p "ip号:"  ip
read -p "主机名:" name
expect << EOF
spawn virsh console tedu_node$num
expect "]"    {send "\r"}
expect ":"    {send "root\r"}
expect "Password:"    {send "123456\r"}
expect "#"    {send "setip\r"}
expect ":"    {send "eth$w\r"}
expect ":"    {send "$ip/24\r"}
expect ":"    {send "\r"}
expect "#"          { send "hostnamectl set-hostname $name\r" }
expect "#"          { send "exit\r" }
EOF
else
exit;
fi
