# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.

Vagrant.configure("2") do |config|
  config.vm.define "app" do |app|
    app.vm.box = "ubuntu/bionic64"
  end

  # chooses to provision with chef solo
  config.vm.provision "chef_solo" do |chef|
    chef.add_recipe "provisioning_vagrant"
    chef.arguments = "--chef-license accept"
  end

  # does not currently work. vagrant syncs it to default location first
  config.vm.synced_folder "./development", "/home/ubuntu/development"
end
