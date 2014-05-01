#!/bin/bash

# install sshpass before this script works
#sudo apt-get install sshpass

DEST=$1
USER=$2
PASSWORD=$3


SSHCMD = "sshpass -p \"$PASSWORD\" ssh ${USER}@${DEST}"