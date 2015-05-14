#!/bin/bash

for (( i=1; i <= 200; i++ ))
do
	echo "VM number $i"
	echo "VM namae : STLDFVM$i"
	./del_cf.sh 10.4.0.$i  'root01' root 
done
