apt update -y
apt install collectd -y
GRAPHITE_HOST=$(hostname)
sed -i "s/GRAPHITE_HOST/$GRAPHITE_HOST/g" collectd.conf
cp -f ./collectd.conf /etc/collectd/collectd.conf
#export GRAPHITE_HOST=$(ip addr | grep "global dynamic" | awk '{print $2}' | sed 's/\/24//g' )
systemctl start collectd
