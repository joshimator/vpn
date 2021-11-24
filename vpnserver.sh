apt install openvpn openssl  
cd /etc/ssl  
mkdir zertifikate  
openssl genrsa -aes256 -out ca.key 2048  
