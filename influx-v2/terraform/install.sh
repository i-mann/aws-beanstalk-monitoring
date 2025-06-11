#!/bin/bash
sudo yum install -y docker git
sudo systemctl start docker
sudo usermod -a -G docker ec2-user
cd /home/ec2-user
git clone https://github.com/YOURNAME/aws-beanstalk-monitoring-v2.git
cd aws-beanstalk-monitoring-v2/influxdb2
docker-compose up -d
