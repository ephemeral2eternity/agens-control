#!/bin/bash
f=$1
cmd=$2
cat $f | while read LINE; do
	read -a srv <<< "$LINE"
	echo "ssh into ${srv[0]} with ip ${srv[1]} and run command $cmd"
	ssh -i ~/.ssh/google_compute_engine -n Chen@${srv[1]} "cd agens; $cmd"
	echo "Finished running $cmd for ${srv[0]}!!!"
done
