#!/bin/bash
# Edited by lizhiqiang
# The script aim to get current memory usage

MEM_TOTAL=0
MEM_IDLE=0

while true; do 
    MEM_TOTAL=`cat /proc/meminfo | grep MemTotal`
    MEM_IDLE=`cat /proc/meminfo | grep MemFree`

    a=' '
    MEM_TOTAL_NUM=${MEM_TOTAL#*$a}
    MEM_TOTAL_NUM=${MEM_TOTAL_NUM%$a*}

    MEM_IDLE_NUM=${MEM_IDLE#*$a}
    MEM_IDLE_NUM=${MEM_IDLE_NUM%$a*}

    MEM_USAGE=$(($MEM_TOTAL_NUM-$MEM_IDLE_NUM))
    #MEM_USAGE_RATE=$(($MEM_USAGE / $MEM_TOTAL_NUM))
    #MEM_USAGE_RATE=`expr $MEM_USAGE /$MEM_TOTAL_NUM`
    let "MEM_USAGE_RATE=$MEM_USAGE/$MEM_TOTAL_NUM"
    
    echo "total:$MEM_TOTAL_NUM  free:$MEM_IDLE_NUM   usage:$MEM_USAGE_RATE";

    sleep 1

done
