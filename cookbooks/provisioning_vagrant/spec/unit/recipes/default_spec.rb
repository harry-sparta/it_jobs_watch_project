#
# Cookbook:: provisioning_vagrant
# Spec:: default
#
# Copyright:: 2020, The Authors, All Rights Reserved.

require 'spec_helper'

describe 'provisioning_vagrant::default' do
  context 'When all attributes are default, on Ubuntu 18.04' do
    # for a complete list of available platforms and versions see:
    # https://github.com/chefspec/fauxhai/blob/master/PLATFORMS.md
    platform 'ubuntu', '18.04'

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end

    it'should install python3' do
      expect(chef_run).to install_package 'python3'
    end

    it'should install python3-pip' do
      expect(chef_run).to install_package 'python3-pip'
    end

  end
end
