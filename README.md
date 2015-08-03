[![Build Status](https://travis-ci.org/mburns/chef-conntrack.svg)](https://travis-ci.org/mburns/chef-conntrack)

Description
===========

Installs and configures the conntrack host-based intrusion detection system.

Requirements
============

Platform
--------

Tested on Ubuntu

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
