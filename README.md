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
* log_type (possible W, S, M, F)
* log_format
* log_separator
* site_domain
* dns_lookup
* host_alias

Usage
=====

recipe[awstats] makes sure to install the latest awstats package on your distribution. The LWRP can then be used to configure domain-specific statistics.
