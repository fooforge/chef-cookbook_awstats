maintainer       "Mike Adolphs"
maintainer_email "mike@fooforge.com"
license          "Apache 2.0"
description      "Installs awstats and provides an LWRP for creating domain-specific statistics"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "0.2.2"

depends          "apache2"
depends          "htpasswd"

supports         "debian"
