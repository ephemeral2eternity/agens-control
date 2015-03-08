#!/bin/bash
srvName=$1
srvZone=$2

gcloud compute instances create $srvName --image django-cache-agent --machine-type f1-micro --zone $srvZone --scope compute-rw storage-full userinfo-email
srvIP=$(gcloud compute instances list |grep $srvName |awk '{print $5}')
wget "http://$srvIP:8615/overlay/init/"
cat ./index.html
