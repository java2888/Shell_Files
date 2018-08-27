#!/usr/bin/env bash

PASSWORD="654321"
SYNC_TIME_SERVER="pool.ntp.org"
doSync_time(){
  echo "Current host is $(hostname)"
  echo $PASSWORD | sudo -S ntpdate -u ${SYNC_TIME_SERVER}
  for X in {1..2}
   do
      ssh Slave$X "echo 'Current host is '; hostname; echo ${PASSWORD} | sudo -S ntpdate -u ${SYNC_TIME_SERVER} "
   done
  
}

read -p "Please enter a number: " NUM
if [ $NUM = 1 ]; then
   echo "The number entered is $NUM, and it's right."
   doSync_time
else
   echo "Then number enterd is $NUM, and it's false."
   exit
fi
