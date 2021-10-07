#!/bin/bash
export DEBIAN_FRONTEND="noninteractive"
sudo apt install -y software-properties-common
sudo add-apt-repository --yes --update ppa:ansible/ansible
wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -
sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
sudo apt update
sudo apt install -y ansible
sudo apt install -y openjdk-11-jdk
sudo apt install -y jenkins
sudo systemctl enable jenkins
sudo systemctl start jenkins
echo "Waiting for Jenkins to start up..."
sleep 60
echo "The Jenkins initial Admin Password is:"
sudo cat /var/lib/jenkins/secrets/initialAdminPassword
