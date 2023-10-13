#!/bin/bash

#apt install openjdk-11-jdk
#echo "export JAVA_HOME=$(dirname $(dirname $(readlink -f $(which java))))" | tee ~/.bashrc
#echo "export PATH=$PATH:$JAVA_HOME/bin" | tee ~/.bashrc
#source ~/.bashrc
sudo apt-get update
sudo apt-get install nginx
sudo systemctl restart nginx

#influxDB telegraf
wget -q https://repos.influxdata.com/influxdata-archive_compat.key
echo '393e8779c89ac8d958f81f942f9ad7fb82a25e133faddaf92e15b16e6ac9ce4c influxdata-archive_compat.key' | sha256sum -c && cat influxdata-archive_compat.key | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/influxdata-archive_compat.gpg > /dev/null
echo 'deb [signed-by=/etc/apt/trusted.gpg.d/influxdata-archive_compat.gpg] https://repos.influxdata.com/debian stable main' | sudo tee /etc/apt/sources.list.d/influxdata.list

sudo apt-get update && sudo apt-get install telegraf