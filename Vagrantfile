# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant::Config.run do |config|
  #config.vm.host_name = "foo"
  config.vm.box = "precise64"
  config.vm.box_url = "http://files.vagrantup.com/precise64.box"

  config.vm.forward_port 80, 8080

  config.vm.share_folder "v-data", "/vagrant_data", "data"

  config.vm.provision :shell, :inline => "sudo apt-get update && sudo apt-get install puppet -y"

  config.vm.provision :puppet do |puppet|
     puppet.manifests_path = "puppet/manifests"
     puppet.manifest_file  = "base.pp"
     puppet.module_path    = "puppet/modules"
     #puppet.options        = "--verbose --debug"
  end
end
