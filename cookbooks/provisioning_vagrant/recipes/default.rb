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

# install python required modules
python 'requirements' do
  command "pip install -r ~/code/eng_48_devops/week_4/it_jobs_watch_project/development/requirements.txt"
  action :run
end
