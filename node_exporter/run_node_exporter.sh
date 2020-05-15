#!/bin/sh
./node_exporter --web.listen-address="0.0.0.0:9100" > /dev/null 2>&1 &
echo PROMETHEUS_HOST=$(ip addr | grep "global dynamic" | awk '{print $2}' | sed 's/\/24//g' ) > ../.env

