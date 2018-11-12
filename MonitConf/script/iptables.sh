#!/bin/bash

/sbin/iptables -L  > /home/senops/script/iptables.txt

iptables=$(cat /home/senops/script/iptables.txt )
echo "$iptables"
