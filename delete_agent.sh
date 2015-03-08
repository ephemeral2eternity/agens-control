#!/bin/bash
srvName=$1
srvIP=$(gcloud compute instances list |grep $srvName | awk '{print $5}')

wget "http://$srvIP:8615/overlay/delete/"
gcloud compute instances delete $srvName
