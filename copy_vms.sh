#!/bin/bash
f=$1
srcFile=$2
dstFile=$3
cat $f | while read LINE; do
        read -a srv <<< "$LINE"
	srvName=${srv[0]}
	srvIP=${srv[1]}
	echo "scp from $srvName in folder $srcFile to localfolder $dstFile"
	scp -i ~/.ssh/google_compute_engine chenw@$srvIP:~/$srcFile $dstFile
done
