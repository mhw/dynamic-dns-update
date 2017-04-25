#!/bin/sh
changequote(`[', `]')
set -e

IFACE=`netstat -rn -f inet | awk '/^0.0.0.0/ { print [substr($0,74,10)]; }
/^default.*UG/ { print [substr($0,65,10)]; }'`
IP=`ipconfig getifaddr ${IFACE}`

domains='HOSTNAME-dt'
update='https://www.duckdns.org/update'
id='DUCKDNS_ID'

if [[ `curl -sfo - "${update}?domains=${domains}&token=${id}&ip=${IP}"` == OK ]]
then
  echo updated $domains to $IP | logger -t $0
else
  echo DNS update failed | logger -t $0
fi

# launchd will assume that the process should run for 10 seconds or more
sleep 60
