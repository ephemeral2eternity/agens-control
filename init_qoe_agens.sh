#!/bin/bash
f=$1
cat $f | while read LINE; do
	read -a srv <<< "$LINE"
	srvName=${srv[0]}
	srvIP=${srv[1]}
	echo "Send qoe/init messages to all peer nodes for agent $srvName with ip $srvIP!"
	wget --output-document=./rsp.html --timeout=300 http://$srvIP:8615/qoe/init/
	cat ./rsp.html
done
