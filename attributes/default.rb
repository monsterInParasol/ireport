#
# Cookbook Name:: ireport
# Recipe:: default
#
# Copyright (C) 2014 Pablo Fonseca
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#


default['ireport']['version'] = '5.6.0'

version = default['ireport']['version']

def is_classic(v)
  v.split('.').join('').to_i <= 300
end

default['ireport']['url'] = "http://sourceforge.net/projects/ireport/files/iReport#{if is_classic version then ' (classic)' else '' end}/iReport-#{version}/iReport-#{version}.zip/download"

default['ireport']['default_user'] = 'ubuntu'
