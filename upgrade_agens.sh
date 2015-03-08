#!/bin/bash
f=$1
cat $f | while read LINE; do
        read -a srv <<< "$LINE"
	srvName=${srv[0]}
	srvIP=${srv[1]}
        echo "ssh into cache agent $srvName with ip $srvIP and do git pull in agens folder"
	ssh -i ~/.ssh/google_compute_engine -n Chen@$srvIP "cd agens; git pull; python3 manage.py migrate"
	echo "upgrading done for $srvName!!!"
done
