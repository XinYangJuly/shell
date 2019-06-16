read -p "请输入ip的网络位如192.168.4.i :" Network
read -p "for循环值ip主机位值,如:50" num
for i in $num
do
     scp /linux-soft/03/mysql/mysql-5.7.17.tar ${Network}$i:/root/
done
for i in $num
do
    ssh ${Network}$i "mkdir mysql; mv mysql-5.7.17.tar mysql/; cd mysql; tar -xf mysql-5.7.17.tar; yum -y install mysql-comm*.rpm; systemctl start mysqld;"
done
for i in $num
do
    scp /linux-soft/03/mysql/libev-4.15-1.el6.rf.x86_64.rpm ${Network}${i}:/root/mysql
    scp /linux-soft/03/mysql/percona-xtrabackup-24-2.4.7-1.el7.x86_64.rpm ${Network}$i:/root/mysql
done
