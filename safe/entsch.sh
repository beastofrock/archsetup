echo "suche"
read suche
openssl enc -aes-256-cbc -md sha512 -pbkdf2 -salt -d -in file01.txt.enc -out file01.txt
cat file01.txt | grep $suche | sed -e 's/;/,/g' | column -t -s,
echo "deleting...."
rm file01.txt
ls -lah
echo "good.. no file here"
