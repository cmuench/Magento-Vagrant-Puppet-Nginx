# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"
Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  #config.vm.host_name = "foo"
  config.vm.box = "precise64"
  config.vm.box_url = "http://files.vagrantup.com/precise64.box"

  config.vm.network "forwarded_port", guest: 80, host: 8080

  config.vm.synced_folder "data", "/vagrant_data"

  config.vm.provision :shell, :inline => "sudo apt-get update && sudo apt-get install puppet -y"

  config.vm.provision :puppet do |puppet|
     puppet.manifests_path = "puppet/manifests"
     puppet.manifest_file  = "base.pp"
     puppet.module_path    = "puppet/modules"
     #puppet.options        = "--verbose --debug"
  end
end
