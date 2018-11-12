#!/bin/bash

iostat -d -x -k /dev/sda 1 5 |grep sda | awk  '{sum+=$6}END{print sum/5;}'  > /home/senops/script/sda_read.txt

sda=$(cat /home/senops/script/sda_read.txt | sed 's/\..*//'  )
echo "$sda KB/s"

if (("$sda" >  1000 )); then
	exit 1
fi

exit 0
