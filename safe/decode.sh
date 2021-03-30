openssl enc -aes-256-cbc -md sha512 -pbkdf2 -salt -d -in file01.txt.enc -out file01.txt
cat file01.txt
#rm file01.txt
echo "delete file?"
read input
if [ "$input" == "y" ];
then
echo "deleting...."
rm file01.txt
ls file01.txt -lah
else
ls file01.txt -lah
echo "good.. no file here"
fi

