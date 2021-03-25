#!/usr/bin/bash
# this is a script for Vagrant provisioning

source sudocheck.sh
source mongoNodejs.sh
# Install dependices 
dependencies () { 
  apt-get install vim python3 evince firefox openssh-server git curl nmap wget -y
}

# set up git server
set () {
  git clone https://github.com/khang2005/ReactState ReactState.git
}

dependencies
set 
