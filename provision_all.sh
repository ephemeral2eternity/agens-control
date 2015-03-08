#!/bin/bash
f=$1

cat $f | while read LINE; do
	read -a agent <<< "$LINE"
	agent_name=${agent[0]}
	agent_zone=${agent[1]}
	gcloud compute instances create $agent_name --image django-cache-agent --machine-type f1-micro --zone $agent_zone \
		--scope compute-rw storage-full userinfo-email
	agent_ip=$(gcloud compute instances list |grep $agent_name |awk '{print $5}')
	wget "http://$agent_ip:8615/overlay/init/"
	cat ./index.html
done
