#!/bin/bash
node_pid=`ps -ef | egrep 'n[o]de' | grep 'max-old-space-size' | grep "laolizi/app.js" | awk '{print $2}'`
if [ "$node_pid" ]; then
    kill ${node_pid}
fi
monitor_running=`ps -ef | egrep 'monitor-suzh[o]u\.sh'`
if [ ! "$monitor_running" ]; then
    echo 'Start monitor-laolizi.sh'
    nohup ./monitor-laolizi.sh > ./nohup.out &
fi