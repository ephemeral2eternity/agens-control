#!/bin/bash
f=$1
cat $f | while read LINE; do
        read -a srv <<< "$LINE"
	srvName=${srv[0]}
	srvIP=${srv[1]}
        echo "ssh into agent $srvName with ip $srvIP and do git clone monitor_agent project"
	ssh -i ~/.ssh/google_compute_engine -n chenw@$srvIP "git clone https://github.com/ephemeral2eternity/monitor_agent.git"
	echo "monitor_agent cloned $srvName!!!"
done
