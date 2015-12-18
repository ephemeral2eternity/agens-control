#!/bin/bash
f=$1
cat $f | while read LINE; do
	read -a agent <<< "$LINE"
	agent_name=${agent[0]}
	agent_zone=${agent[1]}
	echo "#########################################################################################################"
	echo "Provision cache agent $agent_name in zone $agent_zone right now ......."
	gcloud compute instances create $agent_name --image agens-web --machine-type f1-micro --zone $agent_zone --scope compute-rw storage-full userinfo-email
	agent_ip=$(gcloud compute instances list |grep $agent_name |awk '{print $5}')
	echo "Provision agent $agent_name in zone $agent_zone successfully!"
	echo "#########################################################################################################"
done
