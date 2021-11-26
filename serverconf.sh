path="/etc/openvpn/server.conf"

echo "server 192.168.0.0 255.255.255.0" > $path
echo "port 1194" >> $path
echo "proto udp" >> $path
echo "dev tun" >> $path
echo "ca ca.crt" >> $path
echo "cert server.crt" >> $path
echo "key server.key" >> $path
echo "dh dh.pem" >> $path
echo "ping-timer-rem" >> $path
echo "keepalive 20 180" >> $path

systemctl restart openvpn
