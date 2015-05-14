#!/bin/bash

echo "=============================================="
echo "devscript "
echo "=============================================="
	
IPADDR=$1
PASSWD=$2
USER=$3
USER2=$4
PASSWD2=$5

/usr/bin/expect -c 'spawn ssh -p 2222 -o "stricthostkeychecking no" -t '$USER@$IPADDR'
expect "password: "
send "'${PASSWD}'\n"

sudo password root

expect "password: "
send "'${PASSWD}'\n"




##expect "$ " { send "sudo sh -c \"ls -ld /etc/chef &&  mv /etc/chef /tmp/ && echo SUCCESS\"\n" }
##expect "*password*: "
##send "'${PASSWD}'\n"
expect eof '



