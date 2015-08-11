[![Build Status](https://travis-ci.org/mmi-cookbooks/chef-conntrack.svg)](https://travis-ci.org/mmi-cookbooks/chef-conntrack)

Description
===========

Installs and configures [conntrack](http://conntrack-tools.netfilter.org/) to track the maximum number of concurrent network connections to maintain.

Requirements
============

Platform
--------

* Ubuntu 14.04

Attributes
==========

* `node['conntrack']['hashsize']` - (*32,768*) Default value to use 

* `node['conntrack']['max']` - (*computed*) value 4x the `hashsize`

Usage
=====

Add `conntrack` to the node's run_list and optionally set either or both the `hashsize` and `max` values.

    {
      "name": "foo.example.com",
      ...
      "run_list": [
        ...
        "recipe[conntrack]"
      ],
      "default_attributes": {
        ...
        "conntrack": {
          "hashsize": 32768
      }
    }

License and Author
==================

Copyright:: 2012-2015, Rackspace
