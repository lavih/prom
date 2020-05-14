echo PROMETHEUS_HOST=$(ip addr | grep "global dynamic" | awk '{print $2}' | sed 's/\/24//g' ) > ../.env

