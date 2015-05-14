#!/bin/bash
PASSWD=$1
USER=$2
IPADDR=$3
NODENAME=$4
RUNLIST=$5
output=`sshpass -p$PASSWD ssh -o StrictHostKeyChecking=no $USER@$IPADDR 'bash -s' < /home/chfadm01/chef-repo/chk_platform.sh`
if [[ $output == "el6" ]]
then
knife bootstrap $IPADDR --sudo -x $USER -P $PASSWD -N $NODENAME -t /home/chfadm01/chef-repo/lo_boot_rhel6_cf11.erb --use-sudo-password --r "$RUNLIST"
elif [[ $output == "el5" ]]
then
knife bootstrap $IPADDR --sudo -x $USER -P $PASSWD -N $NODENAME -t /home/chfadm01/chef-repo/lo_boot_rhel5_cf11.erb --use-sudo-password --r "$RUNLIST"
echo redhat match el5
elif [[ $output == "ubuntu"* ]]
then
knife bootstrap $IPADDR --sudo -x $USER -P $PASSWD -N $NODENAME -t /home/chfadm01/chef-repo/lo_boot_deb_cf11.erb --use-sudo-password --r "$RUNLIST"
else
echo not matched
fi
