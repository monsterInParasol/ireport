#
# Cookbook Name:: oracle-instantclient
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

ireport_dir = "iReport-#{node['ireport']['version']}"
ireport_zip = "#{ireport_dir}.zip"

remote_file "/opt/#{ireport_zip}" do
  source node['ireport']['url']
end

execute "unzip #{ireport_zip}" do
  cwd '/opt'
end

file "create ireport shortcut" do
  path "/home/#{node['ireport']['default_user']}/Desktop/ireport.desktop"
  mode '0777'
  bin_dir = "/opt/#{ireport_dir}/bin/"
  content <<-EOH
[Desktop Entry]
Version=1.0
Name=iReport
Comment=iReport
Exec=#{bin_dir}/ireport
Icon=#{bin_dir}/document.ico
Terminal=false
Type=Application
Categories=Utility;Programming;Application
  EOH
  
end

