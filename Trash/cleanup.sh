#!/bin/bash

curr_time=`date -d now +%s`

echo "Current time: $curr_time"

del_time=$((curr_time-2628000))

echo "Delete time: $del_time"

cd ~/.Trash

FILES=~/.Trash/*

for delete in $FILES
do
    file_stat=`stat -c %X $delete`
    if [ $file_stat -lt $del_time ]
    then
        echo "$delete: $file_stat"
        /bin/rm -rvf $delete
    fi
done
