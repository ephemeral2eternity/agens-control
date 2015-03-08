#!/bin/bash
f=$1
cat $f | while read LINE; do
        read -a srv <<< "$LINE"
        echo "ssh into cache agent $srv[0] with ip $srv[1] and do git pull in agens folder"
	ssh -i ~/.ssh/google_compute_engine -n Chen@$LINE "cd agens; git pull; python3 manage.py migrate"
	echo "upgrading done for $LINE!!!"
done
