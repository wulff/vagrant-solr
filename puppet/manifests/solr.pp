# basic site manifest

# define global paths and file ownership
Exec { path => '/usr/sbin/:/sbin:/usr/bin:/bin' }
File { owner => 'root', group => 'root' }

# create a stage to make sure apt-get update is run before all other tasks
stage { 'bootstrap': before => Stage['main'] }

class solr::bootstrap {
  # we need an updated list of sources before we can apply the configuration
	exec { 'solr_apt_update':
		command => '/usr/bin/apt-get update',
	}
}

class solr::install {
  # install solr and the tomcat servlet container

  package { 'solr-tomcat':
    ensure => present,
  }

  # install apache and add a proxy for solr

  class { 'apache': }
  class { 'apache::mod::proxy': }

  apache::mod { 'php5': }
  apache::mod { 'rewrite': }

  apache::vhost::proxy { 'jenkins.33.33.33.10.xip.io':
    port => '80',
    dest => 'http://localhost:8080',
  }
}

class solr::go {
  class { 'solr::bootstrap':
    stage => 'bootstrap',
  }
  class { 'solr::install': }
}

include solr::go