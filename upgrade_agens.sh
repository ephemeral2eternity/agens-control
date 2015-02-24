#!/bin/bash
f=$1
cat $f | while read LINE; do
	echo "ssh into $LINE and do git pull in agens folder!"
	ssh -i ~/.ssh/google_compute_engine -n Chen@$LINE "cd agens; git pull; python3 manage.py migrate"
	echo "upgrading done for $LINE!!!"
done
