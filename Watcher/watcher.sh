#!/bin/bash
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
