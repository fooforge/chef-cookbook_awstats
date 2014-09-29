name             "awstats"
description      "Installs awstats and provides an LWRP for creating domain-specific statistics"
version          "0.2.2"
license          "Apache 2.0"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
maintainer       "Mike Adolphs"
maintainer_email "mike@fooforge.com"

supports         "debian"
supports         "ubuntu"

depends          "apache2", ">= 2.0.0"
depends          "cron"

depends          "htpasswd"
