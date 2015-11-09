# encoding: UTF-8
# License:: Apache License, Version 2.0
#

require_relative 'spec_helper'

describe package('conntrack') do
  it { should be_installed }
end

describe file('/etc/modprobe.d/nf_conntrack.conf') do
  it { should be_file }
  it { should be_owned_by 'root' }
  it { should be_grouped_into 'root' }
  it { should be_mode 644 }
end
