# agens-control
The bash script to control the starting, stoping and upgrading of agens system

## Steps to use the script
Generate the ip list for all cache agents
* Authorize your machine to use gcloud
```
gcloud auth login
```
* Get the list ips for all cache agents in AGENS system
```
gcloud compute instances list |grep cache- |awk '{print $5}' > cache_ips
```
* Run bash script "upgrade_agens.sh" to upgrade all nodes listed in cache_ips
```
./upgrade_agens.sh cache_ips
```
