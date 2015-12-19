#!/bin/bash
f=$1
cat $f | while read LINE; do
        read -a srv <<< "$LINE"
	srvName=${srv[0]}
	srvIP=${srv[1]}
        echo "ssh into cache agent $srvName with ip $srvIP and do git pull in agens folder"
	ssh -i ~/.ssh/google_compute_engine -n chenw@$srvIP "sudo apt-get update; sudo apt-get install inetutils-traceroute; sudo apt-get install traceroute;"
	echo "Traceroute installed for $srvName!!!"
done
