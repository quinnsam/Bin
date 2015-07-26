#!/bin/bash
#set +e
# Always assume initial connection will be successful
export AUTOSSH_GATETIME=0
# Disable echo service, relying on SSH exiting itself
#export AUTOSSH_PORT=0
#to test, use (check out man ssh for explanation of options:
#autossh -vv -- $SSH_OPTIONS -o 'ControlPath none' -R 10101:localhost:22 user@Home.local -N > /var/user_sshlog.out 2> /var/user_ssh_error.out &
#once proven, use (and rem out previous command):
sleep 30;

autossh -f -M 10984 -o 'ControlPath=none' -o "PubkeyAuthentication=yes" -o "PasswordAuthentication=no" -R 6969:localhost:22 squinn@mobkilla.no-ip.biz -N #2> /var/user_ssh_error.out &
