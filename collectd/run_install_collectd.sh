apt update -y
apt install collectd -y
cp -f ./collectd.conf /etc/collectd/collectd.conf
systemctl start collectd
systemctl enable collectd

