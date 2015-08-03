require 'chefspec'
require_relative 'spec_helper'

describe 'conntrack::default' do
  before { stub_resources }

  let(:chef_run) { ChefSpec::SoloRunner.new.converge(described_recipe) }

  it 'installs package' do
    expect(chef_run).to install_package('conntrack')
  end

  it 'writes config file' do
    expect(chef_run).to create_template('/etc/modprobe.d/nf_conntrack.conf')
  end

  # /proc/sys/net/nf_conntrack_max

  # /sys/module/nf_conntrack/parameters/hashsize
end
