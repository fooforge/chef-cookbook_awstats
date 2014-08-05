chef_cookbook-awstats [![Build Status](https://secure.travis-ci.org/fooforge/chef-cookbook_awstats.png)](http://travis-ci.org/fooforge/chef-cookbook_awstats)
=========================

Description
-----------

This cookbook installs awstats and provides an LWRP to setup awstats for a service of your choice.

Requirements
------------

Currently only Debian 6+ (and probably Ubuntu) is supported.

Depends on
* apache2
* htpasswd

Attributes
----------

### LWRP

#### domain_statistics

Those are the attributes that can be configured with the LWRP. For more detailed explanations consult the awstats log file under templates/default or the [official documentation](http://awstats.sourceforge.net/#DOC).

<table>
  <thead>
    <tr>
      <th>Attribute</th>
      <th>Description</th>
      <th>Default Value</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>domain_name</td>
      <td>
        <b>Name attribute:</b>The domain name to be processed by awstats
      </td>
      <td><code>nil</code></td>
    </tr>
    <tr>
      <td>log_location</td>
      <td>
        The directory containing the webserver's log files for the domain.
      </td>
      <td><code>/var/log/apache2/access.log</code></td>
    </tr>
    <tr>
      <td>log_type</td>
      <td>
        Type of log. Possible values are <strong>web</strong>, <strong>stream</strong>, <strong>mail</strong> and <strong>ftp</strong>.
      </td>
      <td>web</td>
    </tr>
    <tr>
      <td>log_format</td>
      <td>
        Type of log format. Possible values are <strong>combined</strong>, <strong>iis</strong>, <strong>webast</strong>, <strong>common</strong> and <strong>custom</strong>.
      </td>
      <td>combined</td>
    </tr>
    <tr>
      <td>log_seperator</td>
      <td>
        Type of log seperator.
      </td>
      <td><code>[[WHITESPACE]]</code></td>
    </tr>
    <tr>
      <td>dns_lookup</td>
      <td>
        Option to enable, disable or make DNS lookups static. Possible values are <strong>0</strong> (nope), <strong>1</strong> (YIP) and <strong>static</strong> (static YIP).
      </td>
      <td><code>1</code></td>
    </tr>
    <tr>
      <td>host_aliases</td>
      <td>
        Aliases for the domain_name
      </td>
      <td><code>localhost 127.0.0.1</code></td>
    </tr>
    <tr>
      <td>skipped_hosts</td>
      <td>
        Array of hosts to be skipped when generating the statistics
      </td>
      <td><code>[ "127.0.0.1", "localhost" ]</code></td>
    </tr>
    <tr>
      <td>cron_minute</td>
      <td>
        The interval in minutes defining how often the cronjob for generating statistics gets executed
      </td>
      <td><code>*/15</code> (every 15 minutes)</td>
    </tr>
    <tr>
      <td>cron_hour</td>
      <td>
        The interval in hours defining how often the cronjob for generating statistics gets executed
      </td>
      <td><code>*</code></td>
    </tr>
    <tr>
      <td>cron_day</td>
      <td>
        The interval in days defining how often the cronjob for generating statistics gets executed
      </td>
      <td><code>*</code></td>
    </tr>
    <tr>
      <td>cron_month</td>
      <td>
        The interval in months defining how often the cronjob for generating statistics gets executed
      </td>
      <td><code>*</code></td>
    </tr>
    <tr>
      <td>cron_weekday</td>
      <td>
        The interval in weekdays defining how often the cronjob for generating statistics gets executed
      </td>
      <td><code>*</code></td>
    </tr>
    <tr>
      <td>cron_user</td>
      <td>
        The user in whose context the cronjob gets executed
      </td>
      <td>root</td>
    </tr>
    <tr>
      <td>cron_contact</td>
      <td>
        The user that gets notified via E-Mail if the cronjob fails for some reason (it's presumed that SMTP is properly configured)
      </td>
      <td>root</td>
    </tr>
  </tbody>
</table>

Usage
-----

`recipe[awstats]` makes sure to install the latest awstats package on your distribution. The LWRP can then be used to configure domain-specific statistics.

You then can enable awstats statistics and a proper htpasswd in your application-specific cookbook like this:

    awstats_domain_statistics 'example.com' do
      log_location '/var/log/apache2/example.com-access.log'
    end
    
    htpasswd '/etc/apache2/htpasswd_awstats' do
      user 'fooforge'
      password 'egrofoof'
    end

Development
-----------

* Source hosted at [GitHub](https://github.com/fooforge/chef-cookbook_awstats)
* Report issues/Questions/Feature requests on [GitHub Issues](https://github.com/fooforge/chef-cookbook_awstats/issues)

Pull requests are very welcome! Make sure your patches are well tested.
Ideally create a topic branch for every separate change you make.

License and Author
------------------

Author:: [Mike Adolphs](http://fooforge.com)

Copyright 2012, Mike Adolphs

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
