#!/bin/bash

for (( i=1; i <= 200; i++ ))
do
	echo "VM number $i"
	echo "VM namae : STLDFVM$i"
	./chk_plat_install.sh 'root01' root 10.4.0.$i shard_test-STLDFVM$i
done
