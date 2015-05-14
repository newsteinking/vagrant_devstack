#!/bin/bash

echo "=============================================="
echo "Basic Devstack script " 
echo "=============================================="
	
#./chk_plat_install.sh 'vagrant' vagrant 127.0.0.1 
#./chk_plat_install.sh 127.0.0.1  'vagrant' vagrant 
#./devscript_ubuntu.sh 127.0.0.1  'vagrant' vagrant 'stack' stack 
./add_hostfile.sh  10.3.0.121  'vagrant' 10.3.0.121 vagrant vagrant 
#./chk_plat_install.sh 10.3.0.121  'vagrant' vagrant 
./chk_plat_install.sh vagrant  'vagrant' vagrant
