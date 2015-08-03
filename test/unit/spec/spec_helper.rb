# encoding: UTF-8
# -*- mode: ruby -*-
# vi: set ft=ruby :

require 'rspec/expectations'
require 'chefspec'
require 'chefspec/berkshelf'
require 'chef/application'

::LOG_LEVEL = :fatal
::UBUNTU_OPTS = {
  platform: 'ubuntu',
  version: '14.04',
  log_level: ::LOG_LEVEL
}
::CHEFSPEC_OPTS = {
  log_level: ::LOG_LEVEL
}

def stub_resources
  stub_command('ls /proc/sys/net/nf_conntrack_max >/dev/null &&! grep 131072 /proc/sys/net/nf_conntrack_max >/dev/null').and_return(true)
  stub_command('ls /sys/module/nf_conntrack/parameters/hashsize >/dev/null &&! grep 32768 /sys/module/nf_conntrack/parameters/hashsize >/dev/null').and_return(true)
end

at_exit { ChefSpec::Coverage.report! }
