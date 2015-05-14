#!/bin/bash

for (( i=1; i <= 6; i++ ))
do
	echo "VM number $i"
	echo "VM namae : STLDFVM$i"
	./del_cf.sh 10.3.0.21$i  'root01' root 
done
