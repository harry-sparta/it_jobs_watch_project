#
# Cookbook:: provisioning_vagrant
# Recipe:: default
#
# Copyright:: 2020, The Authors, All Rights Reserved.


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

# remote creates requirement.txt file from a copy in file/default/
template 'requirements.txt' do
  mode '0777'
  source 'requirements.txt.erb'
  path '/home/ubuntu/development/requirements.txt'
  action :create
end

# install python required modules on the requirements
execute 'requirements.txt' do
  command 'sudo -H pip3 install -r /home/ubuntu/development/requirements.txt'
  action :run
end
