#!/usr/bin/bash
# Description

# installing nodejs
installer () {
  apt install nodejs npm 
}
# installing mongodb
mongodb () {
  echo " First import the MongoDB public GPG Key "
  wget -qO - https://www.mongodb.org/static/pgp/server-4.4.asc | sudo apt-key add -
  read -p " then issues the following command "
  sudo apt-get install gnupg
  wget -qO - https://www.mongodb.org/static/pgp/server-4.4.asc | sudo apt-key add -
  read -p " the is the /etc/apt/sources.list.d/mongodb-org-4.4.list file for Ubuntu 18.04 (Bionic):"
  echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu bionic/mongodb-org/4.4 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.4.list
  sudo apt-get update
  read -p " Then install the latest version of Mongodb"
  sudo apt-get install -y mongodb-org  
}

community () {
  sudo systemctl start mongod 
  read -p " If the above command did not work then use daemon-reload"
  read -p " The following command verify if MongoDB has started successfully"
  sudo systemctl status mongod
  read -p " If it does not work run the following command to enalbe " 
  sudo systemctl enable mongod
}

main () {
  installer 
  mongodb
  community
}

main
