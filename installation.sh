#!/bin/bash

sudo apt upgrade && sudo apt update &&\
curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash - &&\
sudo apt install -y nodejs &&\
sudo npm install -g npm &&\
sudo npm install pm2 -g &&\
sudo apt update && sudo apt install -y nginx