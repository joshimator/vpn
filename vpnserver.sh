apt install openvpn openssl -y  
cd /etc/ssl  
mkdir zertifikate  
cd zertifikate  
openssl genrsa -aes256 -out ca.key 2048  
