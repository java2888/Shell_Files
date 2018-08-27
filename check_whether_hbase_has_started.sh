#!/usr/bin/env bash
read -p "Please enter a number: " NUM
if [ $NUM = 1 ]; then
  echo "The num entered is $NUM, and it's right."
  HOSTNAME=`hostname`
  echo "Current host is $HOSTNAME."
  /home/hadoop/hbase-1.2.6/bin/start-hbase.sh
  sleep 3
  jps -ml |grep hbase|grep -v grep
  for X in {1..2}
    do
	ssh Slave$X " echo 'Current host is '; hostname; jps -ml | grep hbase|grep -v grep "
    done
else
  echo "The number entered is $NUM, and it's false."
  exit
fi
