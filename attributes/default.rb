#
# Cookbook Name:: awstats
# Attributes:: default
#
# Copyright 2011, https://github.com/therobot/
# Copyright 2012, Mike Adolphs
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

default[:awstats][:apache_conf_path] = "#{node[:apache][:dir]}/conf-available"
default[:awstats][:apache_conf_filename] = "#{node[:awstats][:apache_conf_path]}/awstats.conf"

default[:awstats][:cgi_bin_path] = "/usr/lib/cgi-bin"
default[:awstats][:data_path] = "/usr/share/awstats"
default[:awstats][:examples_path] = "/usr/share/doc/awstats/examples"

