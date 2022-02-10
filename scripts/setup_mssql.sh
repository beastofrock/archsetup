apt install gnupg2 curl
curl https://packages.microsoft.com/keys/microsoft.asc -o ms.asc
cat ms.asc 
apt-key add ms.asc 
apt update
apt install -y mssql-server
/opt/mssql/bin/mssql-conf setup
