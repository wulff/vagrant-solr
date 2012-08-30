Vagrant Solr
============

A basic Solr setup configured for use with the Search API contrib module for Drupal.


Installation
------------

1. Download and install Vagrant: http://vagrantup.com/
2. Clone this repository using the `--recursive` flag (to get the submodules).
3. Go to the root of the repository and run `vagrant up`. Building the virtual machine takes only a couple of minutes.


Getting started
---------------

When the virtual machine has booted, you can access the Solr admin interface at the following URL:

    http://solr.33.33.33.20.xip.io/admin/

When you add the Solr server on the Search API admin page, use the following settings to connect to this virtual machine:

    Solr host: solr.33.33.33.20.xip.io
    Solr port: 80
    Solr path: /


Author
------

Morten Wulff  
<wulff@ratatosk.net>