#!/bin/bash
agents=$(gcloud compute instances list |grep cache- |awk '{print $1, $2, $5}')
while read -r LINE; do
	read -a agentArry <<< "$LINE"
	srv=${agentArry[0]}
	srvZone=${agentArry[1]}
	srvIP=${agentArry[2]}
	echo "###################################################################"
	echo "Deleting agent $srv in zone $srvZone with IP $srvIP"
	RESPONSE=$(wget -t 3 http://$srvIP:8615/overlay/delete/)
	echo "$RESPONSE"
	gcloud compute instances delete $srv --delete-disks all --zone $srvZone --quiet
	echo "Delete $srv successfully!"
	echo "###################################################################"
done <<< "$agents"
