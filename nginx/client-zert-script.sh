#!/bin/bash

# Set certificate details
CA_KEY="ca.key"
CA_CERT="ca.crt"
CLIENT_KEY="client.key"
CLIENT_CSR="client.csr"
CLIENT_CERT="client.crt"
CLIENT_P12="client.p12"
DAYS_VALID=365

# Set client details
#CLIENT_COMMON_NAME="mail.domain.com"
read -p "enter hostname: " CLIENT_COMMON_NAME
#CLIENT_PASSWORD="MyPassword"
read -p "enter password for clientzert: " CLIENT_PASSWORD

echo "🔹 Creating a new Certificate Authority (CA)..."

# Generate CA private key
openssl genpkey -algorithm RSA -out $CA_KEY

# Create CA certificate (self-signed)
openssl req -x509 -new -nodes -key $CA_KEY -sha256 -days $DAYS_VALID -out $CA_CERT -subj "/C=DE/ST=BAY/O=$CLIENT_COMMON_NAME CA/CN=$CLIENT_COMMON_NAME"

echo "✅ CA certificate created: $CA_CERT"

echo "🔹 Generating client certificate..."

# Generate client private key
openssl genpkey -algorithm RSA -out $CLIENT_KEY

# Create a CSR (Certificate Signing Request) for the client
openssl req -new -key $CLIENT_KEY -out $CLIENT_CSR -subj "/C=DE/ST=BAY/O=$CLIENT_COMMON_NAME/CN=$CLIENT_COMMON_NAME"

# Sign the client CSR with the CA
openssl x509 -req -in $CLIENT_CSR -CA $CA_CERT -CAkey $CA_KEY -CAcreateserial -out $CLIENT_CERT -days $DAYS_VALID -sha256

echo "✅ Client certificate created: $CLIENT_CERT"

echo "🔹 Exporting client certificate as a .p12 file for Firefox..."

# Convert client certificate and key to PKCS#12 format
openssl pkcs12 -export -out $CLIENT_P12 -inkey $CLIENT_KEY -in $CLIENT_CERT -certfile $CA_CERT -passout pass:$CLIENT_PASSWORD

echo "✅ Client PKCS#12 file created: $CLIENT_P12"

echo "🎉 Done! Import '$CLIENT_P12' into Browser (password: $CLIENT_PASSWORD)"

openssl x509 -noout -modulus -in ca.crt | openssl md5
openssl rsa -noout -modulus -in ca.key | openssl md5

#openssl x509 -in ca.crt -noout -text
#openssl x509 -in client.crt -noout -text

openssl verify -CAfile ca.crt client.crt

echo "ssl_client_certificate /srv/cl/ca.crt;"
echo "ssl_verify_client on;"

echo $CLIENT_PASSWORD > passcode
ls
