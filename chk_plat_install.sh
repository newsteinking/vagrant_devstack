#!/bin/bash
PASSWD=$1
USER=$2
IPADDR=$3
#NODENAME=$4
#RUNLIST=$5
echo "chk_plat_intall======>>> "
output=`sshpass -p$PASSWD ssh  -o StrictHostKeyChecking=no $USER@$IPADDR 'bash -s' < /home/sean/devstack3/chk_platform.sh`
if [[ $output == "el7" ]]
then
echo "RHEL7,CentOS7======>>> "

elif [[ $output == "el6" ]]
then
echo "RHEL6,CentOS6======>>> "

echo "CentOS::devstack configuration & openstack install OK ==============================>>>>> "

#knife bootstrap $IPADDR --sudo -x $USER -P $PASSWD -N $NODENAME -t /home/chfadm01/chef-repo/lo_boot_rhel6_cf11.erb --use-sudo-password --r "$RUNLIST"

elif [[ $output == "el5" ]]
then
echo "RHEL5,CentOS5======>>> "

echo "CentOS::devstack configuration & openstack install OK ==============================>>>>> "

#knife bootstrap $IPADDR --sudo -x $USER -P $PASSWD -N $NODENAME -t /home/chfadm01/chef-repo/lo_boot_rhel5_cf11.erb --use-sudo-password --r "$RUNLIST"
echo redhat match el5
elif [[ $output == "ubuntu"* ]]
then
echo "Ubuntu=========>>> "
#knife bootstrap $IPADDR --sudo -x $USER -P $PASSWD -N $NODENAME -t /home/chfadm01/chef-repo/lo_boot_deb_cf11.erb --use-sudo-password --r "$RUNLIST"

output2=`sshpass -p$PASSWD ssh  -o StrictHostKeyChecking=no $USER@$IPADDR 'bash -s' < /home/sean/devstack3/chk_devstack_config.sh`

./devscript_ubuntu.sh 10.3.0.121  'vagrant' vagrant 

##output2=`sshpass -p$PASSWD ssh -p 2222 -o StrictHostKeyChecking=no $USER@$IPADDR 'bash -s' < /home/sean/devstack3/chk_devstack_config.sh`

echo "ubuntu::devstack configuration & openstack install OK ==============================>>>>> "

else
echo not matched
fi
