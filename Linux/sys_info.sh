#!/bin/bash

echo -e "Script to Display Notable User Info" >> sys_info.txt
echo -e "$(date)" >> sys_info.txt
echo -e "$(date "+%T")" >> sys_info.txt
echo -e "$(whoami)" >> sys_info.txt
echo -e "$(if a | head -9 | tail -1)" >> sys_info.txt
echo -e "$(hostname)" >> sys_info.txt
mkdir -p ~/researc
file /home -type f -perm 777  >> sys_info.txt
#command to find top 10 processes  >> sys_info.txt

