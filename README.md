Vagrant Solr
============

A basic Apache Solr setup configured for use with the Solr contrib modules for Drupal. Currently, the virtual machine can be configured to support either the [Apache Solr Search Integration](http://drupal.org/project/apachesolr) module or the [Search API Solr search](http://drupal.org/project/search_api_solr) module.


Installation
------------

1. Download and install Vagrant: http://vagrantup.com/
2. Clone this repository using the `--recursive` flag (to get the submodules).
3. Go to the root of the repository and run `vagrant up searchapi`. Building the virtual machine usually only takes around five minutes.


Getting started
---------------

When starting the virtual machine you can choose whether you want it to support the *Search API Solr search* module or the *Apache Solr Search Integration* module by starting either the `searchapi` or  the `apachesolr` virtual machine.

### Search API Solr search

To start the virtual machine with support for the `search_api_solr` module:

    vagrant up searchapi

### Apache Solr Search Integration

To start the virtual machine with support for the `apachesolr` module:

    vagrant up apachesolr

### Common settings

When the virtual machine has booted, you can access the Solr admin interface at the following URL:

    http://solr.33.33.33.20.xip.io/admin/

When you add the Solr server on the Search API admin page, use the following settings to connect to this virtual machine:

    Solr host: solr.33.33.33.20.xip.io
    Solr port: 80
    Solr path: /
