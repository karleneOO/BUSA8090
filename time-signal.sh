#!/bin/bash
# save as time-signal.sh
# gives a time signal every hour as well as a differing time signal when between the minutes 30 and 60 past the hour
time=$(date +%I)
count=0
while test $count -lt $time; do
  echo -e "\a"
  sleep 1 # sleep for one second
  count=$[$count+1]
done
sleep 3
 
minute=$(date +%M)
if [ $minute -ge 15 ] && [ $minute -lt 30 ]
then
  echo -e "\a"
elif [ $minute -ge 30 ] && [ $minute -lt 45 ]
then 
  echo -e "\a" 
  echo -e "\a"	
elif [ $minute -ge 45 ] && [ $minute -lt 60 ]
then
  echo -e "\a"
  echo -e "\a"
  echo -e "\a"
fi
