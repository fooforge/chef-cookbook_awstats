#
# Cookbook Name:: awstats
# Provider:: domain_statistics
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

action :add do
  template "/etc/awstats/awstats.#{new_resource.domain_name}.conf" do
    source "awstats.conf.erb"
    cookbook "awstats"
    owner "root"
    group "root"
    mode "0755"
    variables(:domain_name => new_resource.domain_name,
              :log_location => new_resource.log_location,
              :log_type => new_resource.log_type,
              :log_format => new_resource.log_format,
              :log_separator => new_resource.log_separator,
              :site_domain => new_resource.site_domain,
              :dns_lookup => new_resource.dns_lookup,
              :host_aliases => new_resource.host_aliases
              )
  end
end

#  cron "awstats #{params[:name]}" do
#    minute "*/10"
#    command "/usr/lib/cgi-bin/awstats.pl -config=#{params[:name]} -update > /dev/null"
#    user "root"
#    mailto node[:awstats][:notify_contact]
#  end
#end

action :remove do
  # Here be dragons
  true
end
