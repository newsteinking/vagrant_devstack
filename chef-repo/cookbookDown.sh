#!/bin/bash

COOKBOOK=$1
#GIT_SERVER=$2
GIT_SERVER=git@gitlab02v.oms.com:repositories/root/$COOKBOOK.git
#GIT_REPO=git-repo/cookbooks
GIT_REPO=home/chfadm01/git-repo/cookbooks



echo Cookbook name : $COOKBOOK
echo Cookbook Server $GIT_SERVER

cd /$GIT_REPO/$COOKBOOK

if [ $? -eq 0 ]
  then
  var_path=`pwd`
  echo 'Cookbook Directory ' $var_path
  echo Pull from server...
  git fetch
  git pull
  date > TIMESTAMP
else
if [ $? -eq 1 ]
   then
   mkdir /$GIT_REPO/$COOKBOOK
   echo Clone from server...
   
   git clone $GIT_SERVER /$GIT_REPO/$COOKBOOK
   date > TIMESTAMP
   fi
fi

knife cookbook upload $COOKBOOK --cookbook-path /$GIT_REPO/
rm -f TIMESTAMP
