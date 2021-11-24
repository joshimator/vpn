apt install openvpn easy-rsa -y
modprobe tun
make-cadir /root/my_ca
cd /root/my_ca
bash easyrsa clean-all
bash easyrsa build-ca nopass
bash easyrsa gen-dh

bash easyrsa build-server-full server nopass
bash easyrsa build-client-full client01 nopass

cp /root/my_ca/pki/private/server.key /etc/openvpn/
cp /root/my_ca/pki/issued/server.crt /etc/openvpn/
cp /root/my_ca/pki/ca.crt /etc/openvpn/
cp /root/my_ca/pki/dh.pem /etc/openvpn/

cp /root/my_ca/pki/issued/client01.crt /etc/openvpn/
cp /root/my_ca/pki/private/client01.key /etc/openvpn/

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