Vagrant.configure("2") do |config|
  config.vm.define "ubuntu-mysql" do |vm1|
    vm1.vm.hostname = "ubuntu-mysql-server"
    vm1.vm.box = "hashicorp/bionic64"
    #setting up provider
    vm1.vm.provider "virtualbox" do |vb|
      vb.gui = false
      vb.memory = "2048"
      vb.name = "ubuntu-mysql-server"
    end #ending provider
    
    # Adding shell privisioning
    vm1.vm.provision "shell", run: "always", inline: <<-SHELL
      echo "This this the first VM (Bionic64) "
      apt-get install mysql-server-5.7 -y
    SHELL
  end #ending vm1 define

  #### code Don't change this path ####
  config.ssh.insert_key = false 
  config.ssh.username = "vagrant"
  config.ssh.password = "vagrant"
  config.vm.synced_folder "data", "/vagrant_data"
  #### end of code ####
end 
