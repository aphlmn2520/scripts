#!/bin/bash
#small installation script for ubuntu 20.04 operating systems. Script adds ${USER} to docker group
exec 2>&1 | tee docker-install.log
#exec 1> docker-install.log 2>&1 
set -ex

sudo apt update

sudo apt install apt-transport-https ca-certificates curl software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"

sudo apt update

apt-cache policy docker-ce

sudo apt install docker-ce

sudo systemctl status docker

sudo usermod -aG docker ${USER}

echo "The following output should show ${USER} and its groups. Please make sure ${USER} is part of docker group. Restart your session if docker group does not show up."

id -nG

