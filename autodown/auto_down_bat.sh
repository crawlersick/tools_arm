#!/bin/bash
set -x
rm -rf /tmp/auto_down_bat.list
touch /tmp/auto_down_bat.list
IFS=$'\r\n'
namelist=($(cat auto_ani.list))

time_s=`expr "3600" '*' "1"`

while [[ true ]]
do

i=0
	while [[ $i -lt ${#namelist[@]} ]]
	do
	
	grep -q "${namelist[i]}" /tmp/auto_down_bat.list
	ret=$?
	
	if [[ $ret -eq 1 ]]
	then 
		echo 'p-r-o-c-e-s-s-i-n-g '"${namelist[i]}" >> /tmp/auto_down_bat.list
		pogo.sh "${namelist[i]}" &
	fi
	i=`expr $i + 1`
	done
sleep $time_s
namelist=($(cat auto_ani.list))
done