#!/bin/bash
f=$1
cat $f | while read LINE; do
	read -a agent <<< "$LINE"
	agent_name=${agent[0]}
	agent_zone=${agent[1]}
	echo "#########################################################################################################"
	echo "Provision cache agent $agent_name in zone $agent_zone right now ......."
	gcloud compute instances create $agent_name --image django-coop-cache-agent --machine-type f1-micro --zone $agent_zone --scope compute-rw storage-full userinfo-email
	agent_ip=$(gcloud compute instances list |grep $agent_name |awk '{print $5}')
	echo "Provision cache agent $agent_name in zone $agent_zone successfully!"
	echo "ssh into cache agent $agent_name with ip $agent_ip and do git pull in agens folder and run cache agent on port :8615 right now"
	echo "Sleep 2 minutes for VM to start running ......."
	sleep 120
	ssh -i ~/.ssh/google_compute_engine -n Chen@$agent_ip "cd agens; git pull; python3 manage.py migrate; screen -dmS cacheagent python3 manage.py runserver 0.0.0.0:8615"
	echo "Sleep 10 seconds for server to start running......."
	sleep 10
	echo "Initialize the server $agent_name right now......."
	wget --tries=10 --timeout=300 --wait=10 --output-document=./rsp.html "http://$agent_ip:8615/overlay/init/"
	cat ./rsp.html
	echo "Provision and initialize $agent_name successfully in $agent_zone!!"
	echo "#########################################################################################################"
done
