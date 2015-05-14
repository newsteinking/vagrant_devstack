#!/bin/bash

for (( i=1; i <= 6; i++ ))
do
	echo "VM number $i"
	echo "VM namae : STLMGVM$i"
	./chk_plat_install.sh 'root01' root 10.3.0.21$i shard_test-STLMGVM$i
done
