apt install gnupg2 curl
curl https://packages.microsoft.com/keys/microsoft.asc -o ms.asc
cat ms.asc 
apt-key add ms.asc 
apt-get install software-properties-common
add-apt-repository "$(wget -qO- https://packages.microsoft.com/config/ubuntu/20.04/mssql-server-2019.list)"
add-apt-repository "$(wget -qO- https://packages.microsoft.com/config/debian/11/prod.list)"
apt update
apt install -y mssql-server
/opt/mssql/bin/mssql-conf setup
