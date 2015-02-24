#!/bin/bash
f=$1
cmd=$2
cat $f | while read LINE; do
	echo "ssh into $LINE and run command $cmd"
	ssh -i ~/.ssh/google_compute_engine -n Chen@$LINE "cd agens; $cmd"
	echo "Finished running $cmd for $LINE!!!"
done
