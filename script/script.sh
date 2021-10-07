#!/bin/bash
export DEBIAN_FRONTEND="noninteractive"
sudo apt install -y software-properties-common
sudo add-apt-repository --yes --update ppa:ansible/ansible
sudo apt update
sudo apt-get install -y ca-certificates
sudo apt install -y ansible
sudo apt install -y openjdk-11-jdk
wget -qO - https://pkg.jenkins.io/debian/jenkins.io.key | sudo apt-key add -
sudo sh -c 'echo deb https://pkg.jenkins.io/debian binary/ > /etc/apt/sources.list.d/jenkins.list'
sudo apt-get update
sudo apt-get install -y jenkins
sudo systemctl enable jenkins
sudo systemctl start jenkins
echo "Waiting for Jenkins to start up..."
sleep 60
echo "The Jenkins initial Admin Password is:"
sudo cat /var/lib/jenkins/secrets/initialAdminPassword
