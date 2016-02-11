#!/bin/bash
f=$1
cmd=$2
cat $f | while IFS=, read -r a b; do
	srvName=$a
	srvIP=$b
	echo "ssh into remote server $srvName with ip $srvIP and execute command $cmd"
	ssh_cmd="ssh -i /Users/Chen/.ssh/google-chenw -n chenw@$srvIP $cmd"
	# echo $ssh_cmd
	$ssh_cmd
done
