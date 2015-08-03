#
# Cookbook Name:: conntrack
# Recipe:: default
#
# Copyright 2012, Rackspace
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

package 'conntrack'

if node['conntrack'].key?('hashsize') && node['conntrack'].key?('max')
  Chef::Log.warn('Ignoring value for `hashsize` because `max` exists. Setting `hashsize` to 4*`max`.')
end

if node['conntrack'].key?('max')
  hashsize = (node['conntrack']['max'] / 4).ceil
  max = (node['conntrack']['max']).ceil
else
  hashsize = (node['conntrack']['hashsize']).ceil
  max = (node['conntrack']['hashsize'] * 4).ceil
end

template '/etc/modprobe.d/nf_conntrack.conf' do
  mode 00644
  owner 'root'
  group 'root'
  variables(hashsize: hashsize)
end

bash 'set /proc/sys/net/nf_conntrack_max' do
  code "echo #{max} >/proc/sys/net/nf_conntrack_max"
  only_if 'ls /proc/sys/net/nf_conntrack_max >/dev/null &&' \
          "! grep #{max} /proc/sys/net/nf_conntrack_max >/dev/null"
end

bash 'set /sys/module/nf_conntrack/parameters/hashsize' do
  code "echo #{hashsize} >/sys/module/nf_conntrack/parameters/hashsize"
  only_if 'ls /sys/module/nf_conntrack/parameters/hashsize >/dev/null &&' \
          "! grep #{hashsize} /sys/module/nf_conntrack/parameters/hashsize >/dev/null"
end
