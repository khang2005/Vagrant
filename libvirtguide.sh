#!/usr/bin/bash
# Description: this tools is used to help build vagrant-libvirt plugin

# install vagrant
download () { 
  echo"________________________________________________"
  figlet Please install vagrant on the official website
  echo"________________________________________________"
}
# install libvirt
installer() {
  echo" if you don't have libvirt yet type the following command..."
  echo" apt-get build-dep vagrant ruby-libvirt"
  echo"apt-get install qemu libvirt-daemon-system libvirt-clients ebtables dnsmasq-base"
  echo" apt-get install libxslt-dev libxml2-dev libvirt-dev zlib1g-dev ruby-dev" 
  read -p " If you have KVM press any key to continue" 
}

# enable libvird

check () {
  echo"The following command make sure you enable your KVM"
  systemctl enable libvirtd
  systemctl start libvirtd
  systemctl status libvirtd
  read -p " PRESS ANY KEY TO CONTINUE"
}

# install vagrant-libvirt plugin in Linux

plugin () {
  sudo apt install qemu libvirt-daemon-system libvirt-clients libxslt-dev libxml2-dev libvirt-dev zlib1g-dev ruby-dev ruby-libvirt ebtables dnsmasq-base
  echo"if the command above did not work then run the following command"
  echo"_______________________________"
  echo"sudo apt autoremove"
  echo"_______________________________"
  read -p "PLEASE PRESS ANY KEY TO CONTINUE"  
  vagrant plugin install vagrant-libvirt vagrant plugin install vagrant-mutate
}

# get vagrantfile

get () {
  echo" Obtional you can vagrant init with the following choices https://app.vagrantup.com/boxes/search?provider=libvirt"
  echo"If you choose to vagrant init then ignore the following command"
  read -p "If not then press any key to get the vagrantfile below down"
  wget https://raw.githubusercontent.com/phamduchongan93/vagrant/libvirt/Vagrantfile
  read -p "press any key to boost up"
  vagrant up --provider=libvirt
  echo"OR use sudo if not work"
  
}

# addition information
addition () {
  echo" if you are able to run the above commands smoothly then leave if not read the following lines"
  echo" if some how you ran into problems like images is conflict with default then ran following command"
  virsh pool-undefine default
  virsh pool-undefine images
  virsh pool-list --all 
  echo" chage user if needed"
  sudo useradd -aG khang libvirt
  sudo usermod -aG libvirt khang
  read -p "Then restart systemctl"
  systemctl restart libvirtd
} 

main() {
  download
  installer
  check
  plugin
  get
  addition 
}
 
main

