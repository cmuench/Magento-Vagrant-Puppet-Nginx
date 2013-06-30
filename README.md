Magento-Vagrant-Puppet-Nginx
============================

## Installs

* Magento
* MySQL
* PHP
* PHP-FPM
* Nginx
* n98-magerun

## Setup

``` sh
   git submodule init
   git submodule update
   vagrant up

Modify puppet/manifests/base.pp

``` puppet
   class { "magento":
     install_magento     => true,
     magento_version     => "magento-ce-1.6.2.0",
     install_sample_data => true
   }