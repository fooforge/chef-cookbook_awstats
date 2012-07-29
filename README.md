Description
===========

This cookbook installs awstats and provides an LWRP to be used in other, probably application-specific cookbooks to setup awstats.

Requirements
============

n.a. yet

Attributes
==========

### LWRP

#### domain_statistics

* domain_name
* log_location
* log_type
  * web
  * stream
  * mail
  * ftp
* log_format
  * combined
  * iis
  * webstar
  * common
  * OR custom
* log_separator
* site_domain
* dns_lookup
  * 0 = Nope
  * 1 = Yip
  * 2 = Static yip
* host_alias

Usage
=====

recipe[awstats] makes sure to install the latest awstats package on your distribution. The LWRP can then be used to configure domain-specific statistics.
