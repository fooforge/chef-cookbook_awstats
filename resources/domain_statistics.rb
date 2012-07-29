#
# Cookbook Name:: awstats
# Resource:: domain_statistics
#
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

actions :add, :remove

def initialize(*args)
  super
  @action = :add
end

attribute :domain_name, :kind_of => String, :name_attribute => true
attribute :log_location, :kind_of => String, :default => '/var/log/apache2/access.log'
attribute :log_type, :kind_of => String, :default => 'web'
attribute :log_format, :kind_of => String, :default => 'combined'
attribute :log_separator, :kind_of => String, :default => " "
attribute :site_domain, :default => :domain_name
attribute :dns_lookup, :kind_of => Integer, :default => 1
attribute :host_aliases, :kind_of => String, :default => "localhost 127.0.0.1"
attribute :data_directory, :kind_of => String, :default => '/var/lib/awstats'
