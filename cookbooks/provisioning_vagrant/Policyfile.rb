# Policyfile.rb - Describe how you want Chef Infra Client to build your system.
#
# For more information on the Policyfile feature, visit
# https://docs.chef.io/policyfile.html

# A name that describes what the system you're building with Chef does.
name 'provisioning_vagrant'

# Where to find external cookbooks:
default_source :supermarket

# run_list: chef-client will run these recipes in the order specified.
run_list 'provisioning_vagrant::default'  # recipe 1 (testing env)- python, pip, python packages, packer, java, directories

# Specify a custom source for a single cookbook:
cookbook 'provisioning_vagrant', path: '.'
