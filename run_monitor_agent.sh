#!/bin/bash
f=$1
cat $f | while read LINE; do
        read -a srv <<< "$LINE"
	srvName=${srv[0]}
	srvIP=${srv[1]}
        echo "ssh into agent $srvName with ip $srvIP and run monitor_agent in cron every 10 minutes"
	ssh -i ~/.ssh/google_compute_engine -n chenw@$srvIP "echo \"*/10 * * * * python ~/monitor_agent/monitor_agent.py\" | crontab -; crontab -l; sudo service cron status"
	echo "monitor_agent run on $srvName!!!"
done
