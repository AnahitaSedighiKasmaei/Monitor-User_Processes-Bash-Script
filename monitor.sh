#!/bin/bash

maxChildren=6

monitor () {
	strProcess=""
	sendEmail=0;
	for pid in `ps -u | awk '{print $2}'`; 
	do 
	   processCount=$(ps -eo ppid= | grep -Fwc $pid)
	   
	   echo -e "processId is $pid\n"
	   
	   if [ "$processCount" -gt "$maxChildren" ]; then
	   	echo "Has more than $maxChildren children."
		sendEmail=1
	   	for process in `pgrep -P $pid`; do 
	   		strProcess+="$process	$pid\n"
	   	done
	   	
	   	
	   fi

	done

	if [ "$sendEmail" -eq "1" ]; then
		mailBody="=========================\n"
		mailBody+="Process Report\n"
		mailBody+="=========================\n"
		mailBody+="Time: `date`\n"
		mailBody+="=========================\n\n"
		mailBody+=$strProcess
		mail -s "Process Report" "sedighia@uwindsor.ca" < "$mailBody"
	fi
	echo -e "$mailBody" >> log.txt
}

while true
do
	echo "===========[Monitoring]============"
	monitor

	sleep 300
done








