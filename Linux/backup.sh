#!/bin/bash

tar -cvvf /var/backups/home.tar /home
mv /var/backups/home.tar /var/backups/home.10132021.tar
ls -lah /var/backups > /var/backups/file_report.txt
free -h > /var/backups/disk_report.txt
apt update
apt upgrade
apt autoremove
#apt {update, upgrade, autoremove}
