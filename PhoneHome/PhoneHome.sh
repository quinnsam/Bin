#!/bin/bash
#set +e
# Always assume initial connection will be successful
export AUTOSSH_GATETIME=0
# Disable echo service, relying on SSH exiting itself
#export AUTOSSH_PORT=0
#to test, use (check out man ssh for explanation of options:
#autossh -vv -- $SSH_OPTIONS -o 'ControlPath none' -R 10101:localhost:22 user@Home.local -N > /var/user_sshlog.out 2> /var/user_ssh_error.out &
#once proven, use (and rem out previous command):
#sleep 30;

if [ "$HOSTNAME" = "Alpha" ]; then
    port=6969
    #echo "ET Alpha"
elif [ "$HOSTNAME" = "Chi" ]; then
    port=7777
    #echo "ET Chi"
else
    echo "N/A"
    exit 0
fi

autossh -M 10984 -o 'StrictHostKeyChecking=no' -o 'ControlPath=none' -o "PubkeyAuthentication=yes" -o "PasswordAuthentication=no" -R $port:localhost:22 squinn@mobkilla.no-ip.biz -N 2> /home/squinn/logs/PhoneHome.log

exit $?
