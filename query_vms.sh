#!/bin/bash
f=$1
cmd=$2
cat $f | while read LINE; do
        read -a srv <<< "$LINE"
	srvName=${srv[0]}
	srvIP=${srv[1]}
	echo "ssh into agent $srvName with ip $srvIP and do $2"
	ssh -i ~/.ssh/google_compute_engine -n chenw@$srvIP $2
done
