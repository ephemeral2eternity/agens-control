#!/bin/bash
srvName=$1
srvZone=$2

gcloud compute instances create $srvName --image django-cache-agent --machine-type f1-micro --zone $srvZone --scope compute-rw storage-full userinfo-email
srvIP=$(gcloud compute instances list |grep $srvName |awk '{print $5}')
echo "ssh into cache agent $srvName with ip $srvIP and do git pull in agens folder"
ssh -i ~/.ssh/google_compute_engine -n Chen@$srvIP "cd agens; git pull; python3 manage.py migrate; python3 manage.py runserver 0.0.0.0:8615"
RESPONSE=$(wget -qO http://$srvIP:8615/overlay/init/)
echo $RESPONSE
echo "Provision and initialize $srvName in zone $srvZone successfully!"
