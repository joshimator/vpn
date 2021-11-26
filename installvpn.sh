apt install openvpn easy-rsa -y
modprobe tun
make-cadir /root/my_ca
cd /root/my_ca
bash easyrsa clean-all
bash easyrsa build-ca nopass
bash easyrsa gen-dh

bash easyrsa build-server-full server nopass
bash easyrsa build-client-full client01 nopass
