#!/bin/bash

IPADDR=$1
PASSWD=$2
USER=$3
/usr/bin/expect -c 'spawn  ssh -o "stricthostkeychecking no" -t '$USER@$IPADDR'
expect "password: "
send "'${PASSWD}'\n"
expect "$ " { send "sudo sh -c \"ls -ld /etc/chef &&  mv /etc/chef /tmp/ && echo SUCCESS\"\n" }
expect "*password*: "
send "'${PASSWD}'\n"
expect eof '