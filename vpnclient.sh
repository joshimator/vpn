cd /etc/openvpn/ 

rm /etc/openvpn/server.conf

path="/etc/openvpn/client.conf"

echo Server-IP:
read Sip

echo "client" > $path
echo "remote $Sip 1194" >> $path
echo "proto udp" >> $path
echo "dev tun" >> $path
echo "ca ca.crt" >> $cpath
echo "cert client01.crt" >> $path
echo "key client01.key" >> $path
echo "remote-cert-tls server" >> $cpath
echo "ping-timer-rem" >> $path
echo "keepalive 20 180" >> $path

systemctl restart openvpn