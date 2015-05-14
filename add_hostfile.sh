#!/bin/bash
## set variables
IPADDR=$1
PASSWD=$2
CHEF_SERVER_IP=$3
CHEF_SERVER_HN=$4
USER=$5
CHANGE_HOSTNAME_SCRIPT_DIR=/root/
#CHANGE_HOSTNAME_SCRIPT_DIR=/home/chfadm01/
CHANGE_HOSTNAME_SCRIPT=add_hostname_chefclient.sh
## Check Argument
if [ "$IPADDR" = "" ] || [ "$PASSWD" = "" ]
 then
  echo "Usage : $0 {IPADDRESS} 'Chef Client user password' "
  exit 1
fi

##### add chef server ip to the hostsfile ######
cat >  expect.sh << EOF
/usr/bin/expect -c 'spawn  ssh -o "stricthostkeychecking no" -t $USER@$IPADDR "echo '${PASSWD}' | sudo -S -- sh -c \"grep -iv ^# /etc/hosts | grep -wq $CHEF_SERVER_IP || grep -iv ^# /etc/hosts | grep -wq $CHEF_SERVER_HN || echo ${CHEF_SERVER_IP} ${CHEF_SERVER_HN} >> /etc/hosts\""
expect "password: "
send "${PASSWD}\n"
expect eof'
EOF


bash expect.sh > expect.tmp
RC=1
if [ `cat expect.tmp | grep -v Permanently | wc -l` -eq 3 ]
        then
        LINE2=`grep ^$USER expect.tmp | wc -l`
                if [ `grep ^$USER expect.tmp | wc -l` -eq 1 ]
                then
                RC=0
                fi
fi

rm -f expect.sh
if [ $RC -eq 1 ]
then
echo "FAIL"
else
echo "SUCCESS"
fi
exit $RC
