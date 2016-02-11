#!/bin/bash
f=$1
echo "VM List file: $f"
srcFile=$2
dstFile=$3
echo "Copy from remote server file $srcFile to local file $dstFile !"
cat $f | while IFS=, read -r a b; do
	srvName=$a
	srvIP=$b
	echo "scp from $srvName in folder $srcFile to localfolder $dstFile"
	scp -r -i ~/.ssh/google-chenw chenw@$srvIP:~/$srcFile $dstFile
done
