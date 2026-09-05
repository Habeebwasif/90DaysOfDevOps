#!/bin/bash

set -euo pipefail

usage(){
	echo "Usage: ./log_analyzer.sh /path/to/logfile"
	echo "Provide the log file that you want to analyze."
	exit 1
}

check_file(){
	if [ -f $fname ];then
		:
	else
		echo "File doesn't exists"
	fi
}

error_count(){
	echo "TOTAL ERROR COUNT:"
	grep -ic "ERROR" $fname
}

critical_events(){
	echo -e "\n CRITICAL MESSAGES:"
	grep -n "CRITICAL" $fname
}

top5_error(){
	echo -e "\n TOP 5 ERROR MESSAGES:"
	grep "ERROR" $fname | awk '{$1=$2=$3=$NF=""; print}' | sort | uniq -c | sort -nr | head -5
}

total_lines(){
	echo -e "\n TOTAL LINES PROCESSED"
        wc -l < $fname
}

report(){
	report="log_report_$(date +%Y-%m-%d-%H-%M).txt"
	echo "Date of analysis : $(date +%Y-%m-%d" Time : "%H:%M)" >> $report
	echo "Log file Name : $fname" >> $report
	total_lines >> $report
	error_count >> $report
	top5_error >> $report
	critical_events >> $report
}

move(){
	mkdir -p archive
	mv $report archive
	echo -e "\nCreated report $report and moved it to archive."
}

if [ $# -eq 0 ];then
	usage
fi
fname=$1
check_file
error_count
critical_events
top5_error
report
move
