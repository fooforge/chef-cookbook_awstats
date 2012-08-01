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
              :dns_lookup => new_resource.dns_lookup,
              :host_aliases => new_resource.host_aliases,
              :data_directory => new_resource.data_directory,
              :skipped_hosts => new_resource.skipped_hosts
              )
    new_resource.updated_by_last_action(true)
  end

  cron "awstats_#{new_resource.domain_name}" do
    minute new_resource.cron_minute
    hour new_resource.cron_hour
    day new_resource.cron_day
    month new_resource.cron_month
    weekday new_resource.cron_weekday
    command "/usr/lib/cgi-bin/awstats.pl -config=#{new_resource.domain_name} -update > /dev/null"
    user new_resource.cron_user
    mailto new_resource.cron_contact
  end

  cookbook_file "/etc/apache2/conf.d/awstats" do
    source "awstats"
    cookbook "awstats"

    owner "root"
    group "root"
    mode "0755"

    notifies :restart, resources(:service => "apache2")
  end

  cookbook_file "/usr/lib/cgi-bin/.htaccess" do
    source "htaccess"
    cookbook "awstats"

    owner "root"
    group "root"
    mode "0755"

    notifies :restart, resources(:service => "apache2")
  end
end

action :remove do
  # Here be dragons
  true
end
