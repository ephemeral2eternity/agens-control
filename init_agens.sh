#!/bin/bash
f=$1
cat $f | while read LINE; do
        read -a srv <<< "$LINE"
	srvName=${srv[0]}
	srvIP=${srv[1]}
        echo "Initialize $srvName with ip $srvIP."
	wget "http://$srvIP:8615/overlay/init/"
	echo ./index.html
done
