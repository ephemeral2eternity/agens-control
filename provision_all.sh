#!/bin/bash
f=$1

cat $f | while read LINE; do
	read -a agent <<< "$LINE"
	agent_name=${agent[0]}
	agent_zone=${agent[1]}
	gcloud compute instances create $agent_name --image django-cache-agent --machine-type f1-micro --zone $agent_zone \
		--scope compute-rw storage-full userinfo-email
	agent_ip=$(gcloud compute instances list |grep $agent_name |awk '{print $5}')
	echo "ssh into cache agent $agent_name with ip $agent_ip and do git pull in agens folder"
	ssh -i ~/.ssh/google_compute_engine -n Chen@$agent_ip "cd agens; git pull; python3 manage.py migrate; python3 manage.py runserver 0.0.0.0:8615"
	RESPONSE=$(wget -qO http://$agent_ip:8615/overlay/init/)
	echo "$RESPONSE"
	echo "Provision and initialize $agent_name successfully in $agent_zone!!"
done
