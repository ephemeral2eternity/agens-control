#!/bin/bash
f=$1
cat $f | while read LINE; do
	echo "dump all trace files in $LINE to google cloud gs://agens-data/!"
	wget "http://$LINE:8615/monitor/dump/"
	wget "http://$LINE:8615/qoe/dump/"
	cat ./index.html
done
