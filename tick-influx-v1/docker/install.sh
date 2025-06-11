#!/bin/bash
sudo yum install -y docker git
sudo service docker start
sudo usermod -a -G docker ec2-user
cd /home/ec2-user
git clone https://github.com/YOURNAME/aws-beanstalk-monitoring.git
cd aws-beanstalk-monitoring/docker
docker-compose up -d
