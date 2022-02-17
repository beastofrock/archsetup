openssl enc -aes-256-cbc -md sha512 -pbkdf2 -salt -in file01.txt -out file01.txt.enc
echo "and now decode for testing....."
bash entsch.sh
