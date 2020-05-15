#!/bin/sh
./node_exporter --web.listen-address="0.0.0.0:9100" > /dev/null 2>&1 &

