#!/bin/bash

set -e

usermod -u ${USER_ID} -s /bin/bash www-data;

if [ -z "$DOCKERHOSTIP" ]; then
    DOCKERHOSTIP=`/sbin/ip route|awk '/default/ { print $3 }'`
fi

meteor --unsafe-perm