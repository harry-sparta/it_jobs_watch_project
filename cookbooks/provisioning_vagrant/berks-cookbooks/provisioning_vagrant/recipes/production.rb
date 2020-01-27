## Cookbook:: provisioning_vagrant
# Recipe:: default
# Copyright:: 2020, The Authors, All Rights Reserved.

# Check policy file to determine which recipe should be ran
# ---------------------------------APT PACKAGES--------------------------------
# packages apt-get
apt_update 'update_sources' do
  action :update
end

# install python3 package
apt_package 'python3' do
  version '3.6*'
  action :install
end

# install python3-pip
apt_package 'python3-pip' do
  action :install
end

# install java to allow jenkins to connect to it
apt_package 'default-jdk' do
  action :install
end

# installing packer
apt_package 'packer' do
  action :install
end

# installing chef
apt_package 'chef' do
  action :install
end

# ---------------------------------DIRECTORIES--------------------------------
# creates a 'Downloads' folder
directory 'Downloads' do
  mode '0777'
  path 'home/ubuntu/Downloads'
  action :create
end

# creates a 'development' folder
directory 'development' do
  mode '0777'
  path 'home/ubuntu/development'
  action :create
end

# ---------------------------------TEMPLATES--------------------------------
# remote creates requirement.txt file from a copy in file/default/
template 'requirements.txt' do
  mode '0777'
  source 'requirements.txt.erb'
  path '/home/ubuntu/development/requirements.txt'
  action :create
end

# ---------------------------------REQUIRMENTS--------------------------------
# install python required modules on the requirements
execute 'requirements.txt' do
  command 'sudo -H pip3 install -r /home/ubuntu/development/requirements.txt'
  action :run
end
