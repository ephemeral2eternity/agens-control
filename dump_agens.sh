#!/bin/bash
f=$1
cat $f | while read LINE; do
	read -a srv <<< "$LINE"
	echo "dump all trace files in ${srv[0]} with ip ${srv[1]} to google cloud gs://agens-data/!"
	wget "http://${srv[1]}:8615/monitor/dump/"
	wget "http://${srv[1]}:8615/qoe/dump/"
	cat ./index.html
done
