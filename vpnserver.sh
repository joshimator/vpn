apt install openvpn openssl -y  
cd /etc/ssl  
mkdir zertifikate  
cd zertifikate  
openssl genrsa -aes256 -out ca.key 2048  
openssl req -new -x509 -days 365 -key ca.key -out ca.crt -set_serial 1  
 
