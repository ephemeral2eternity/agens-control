#!/bin/bash
f=$1
cat $f | while read LINE; do
        read -a srv <<< "$LINE"
	srvName=${srv[0]}
	srvIP=${srv[1]}
        echo "Initialize $srvName with ip $srvIP."
	RESPONSE=$(wget -qO http://$srvIP:8615/overlay/init/)
	echo $RESPONSE
	echo "Initialize cache agent $srvName successfully!"
done
