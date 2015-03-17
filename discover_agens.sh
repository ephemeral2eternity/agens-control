#!/bin/bash
f=$1
cat $f | while read LINE; do
	read -a srv <<< "$LINE"
	srvName=${srv[0]}
	srvIP=${srv[1]}
	echo "Send discover messages to all peer nodes for agent $srvName with ip $srvIP!"
	wget --output-document=./rsp.html --timeout=600 http://$srvIP:8615/video/discover/
	cat ./rsp.html
	echo "###########################################################################"
	sleep 10
done
