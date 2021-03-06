#!/bin/bash
srvName=$1
srvZone=$(gcloud compute instances list |grep $srvName | awk '{print $2}')
srvIP=$(gcloud compute instances list |grep $srvName | awk '{print $5}')
echo $srvIP
wget --output-document=./rsp.html --tries=3 --timeout=300 http://$srvIP:8615/overlay/delete/
cat ./rsp.html
gcloud compute instances delete $srvName --delete-disks all --zone $srvZone --quiet
echo "Delete $srvName successfully!"
