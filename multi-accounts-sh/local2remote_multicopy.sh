#!/bin/bash
f=$1
echo "VM List file: $f"
srcFile=$2
dstFile=$3
echo "Copy from local file $srcFile to remote server file $dstFile !"
cat $f | while IFS=, read -r a b; do
	srvName=$a
	srvIP=$b
	echo "scp local file $srcFile to remote folder $dstFile on server $srvName"
	scp -i ~/.ssh/google-chenw -r $srcFile chenw@$srvIP:~/$dstFile
done
