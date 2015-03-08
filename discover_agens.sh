#!/bin/bash
f=$1
cat $f | while read LINE; do
	read -a srv <<< "$LINE"
	echo "Send discover messages to all peer nodes for agent ${srv[0]} with ip ${srv[1]}!"
	wget "http://${srv[1]}:8615/video/discover/"
	cat ./index.html
done