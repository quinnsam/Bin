#!/bin/bash

# Location of the run/pid folder
RUN='/var/run/Watcher.pid'

# Kills any tmux 0 session and starts the Autodoor program in tmux 0
start_watcher() {
    echo $$ > $RUN
	tail -fn0 /var/log/auth.log | \
    while read line ; do
        print_connected=$(echo "$line" | grep "Accepted")
        if [ $? = 0 ]
        then
            echo "$print_connected" | pb
            echo "$print_connected" >> /home/squinn/logs/SSH_connections.log
            sleep 10
        fi
    done
}

# Check if watcher is running or not
if [ -f "$RUN" ]
then
    ps -p `cat $RUN` > /dev/null 2>&1
    if [ $? == 1 ]
    then
		start_watcher
    fi
else
	start_watcher
fi








