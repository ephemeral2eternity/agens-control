#!/bin/bash
f=$1
cat $f | while read LINE; do
	read -a srv <<< "$LINE"
	echo "dump all trace files in ${srv[0]} with ip ${srv[1]} to google cloud gs://agens-data/!"
	RSP=$(wget -qO http://${srv[1]}:8615/monitor/dump/)
	echo "$RSP"
	RSP2=$(wget -qO http://${srv[1]}:8615/qoe/dump/)
	echo "$RSP2"
done
