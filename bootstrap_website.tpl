#!/bin/bash
sudo apt-get update
sudo apt-get -y upgrade
sudo apt-get install -y apache2
hostnamectl set-hostname Web
sudo apt-get install -y awscli
sudo aws s3 cp s3://surfingjoes-website-files/aerial /var/www/html/. --recursive
cd /home/ubuntu
rm test.txt
touch test.txt
echo "Instance ID: $(curl http://169.254.169.254/latest/meta-data/instance-id)" >> test.txt
echo "Instance Type: $(curl http://169.254.169.254/latest/meta-data/instance-type)" >> test.txt
echo "Host: $(curl http://169.254.169.254/latest/meta-data/hostname)" >> test.txt
echo "IPv4: $(curl http://169.254.169.254/latest/meta-data/local-ipv4)" >> test.txt
echo "AMI: $(curl http://169.254.169.254/latest/meta-data/ami-id)" >> test.txt

sudo cp test.txt /var/www/html/test.txt