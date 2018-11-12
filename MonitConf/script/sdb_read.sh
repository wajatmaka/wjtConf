#!/bin/bash

iostat -d -x -k /dev/sdb 1 5 |grep sdb | awk  '{sum+=$6}END{print sum/5;}'  > /home/senops/script/sdb_read.txt

sdb=$(cat /home/senops/script/sdb_read.txt | sed 's/\..*//'  )
echo "$sdb KB/s"

if (("$sdb" >  1000 )); then
	exit 1
fi

exit 0
