# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box      = 'ubuntu/trusty64'
  config.vm.hostname = 'park.fail-dev-box'

  config.vm.network :forwarded_port, guest: 4000, host: 4000
  config.vm.network :forwarded_port, guest: 3000, host: 3000

  config.vm.provider "virtualbox" do |v|
    v.memory = 4096
  end

  config.vm.synced_folder '.', '/vagrant', disabled: true
  config.vm.synced_folder '.', '/home/vagrant/park.fail'

  config.vm.provision :shell, path: '.vagrant_bootstrap/bootstrap.sh', keep_color: true, privileged: false
  config.vm.provision :shell, path: '.vagrant_bootstrap/install_ruby.sh', privileged: false
end
