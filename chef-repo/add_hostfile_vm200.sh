#!/bin/bash

for (( i=1; i <= 200; i++ ))
do
	echo "VM number $i"
	./add_hostfile.sh 10.4.0.$i root01 10.3.0.222 STLMGCHEF.CNS.COM root
done
