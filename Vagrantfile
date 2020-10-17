Vagrant.configure("2") do |config|
  config.vm.define "ubuntu-vm" do |vm1|
    vm1.vm.hostname = "ubuntu-vm"
    vm1.vm.box = "ubuntu/trusty64"
    #setting up provider
    vm1.vm.provider "virtualbox" do |vb|
      vb.gui = false
      vb.memory = "512"
      vb.name = "ubuntu-vm"
    end #ending provider
    # Adding shell privisioning
   
    vm1.vm.provision "shell", run: "always", inline: <<-SHELL
      echo "This this the first VM (trusty64) "
    SHELL
  end #ending vm1 define
 # config.vm.syced_folder "data", "/vagrant_data"
end
Hello 
