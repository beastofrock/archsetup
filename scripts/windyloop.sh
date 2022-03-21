  GNU nano 6.2                                                                                      windyloop.sh                                                                                                  
#!/bin/bash
echo "starting Session..."
echo "if ws > 7 (17,4 m/s) > raffstore goes up !!!!"

#start "daemon in background"
killall rtl_433
rtl_433 -f 868300000 -X n=data,m=FSK_PCM,s=120,l=120,r=2500,match=Bresser-6 -Y classic -R 172 -F csv:op.csv > rtl.log 2>&1 &

#declare function
f_check () {
a=$(tail -1 op.csv | cut -d ',' -f 16)
b=17
echo "$a"
if (( $(echo "$a > $b" |bc -l) )); then
   curl https://api.telegram.org/botYYYYYYYYYYYYYY:XXXXXXXXXXXXXXXXXXXX/sendMessage -d chat_id=88888888888 -d text="windy!!!! RAFFSTORES UP !!  $a m/s" &> /dev/null
   echo "command for pull up raffstores goes in here"
   sleep 600
fi
echo 'f_check_end'
}

#debug function:
#f_check

#starting loop
while true
do f_check
sleep 5
done

#comments:
#  curl https://api.telegram.org/botyyyyyyyyyyyyyyyyy:xxxxxxxxxxxxxxxxxxxxx/getupdates | tail -n 1 | cut -d ':' -f 14
#  for controlling, eg. if text then do sth. ....
