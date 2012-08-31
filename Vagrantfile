require 'optparse'

facter = {}

opt_parser = OptionParser.new do |opts|
  opts.banner = 'Usage: vagrant up [--searchapi|--apachesolr]'

  opts.on('--searchapi') do
    facter = {'drupalsolrmodule' => 'search_api'}
  end

  opts.on('--apachesolr') do
    facter = {'drupalsolrmodule' => 'apachesolr'}
  end
end.parse!

Vagrant::Config.run do |config|
  config.vm.host_name = 'solr'

  # the base box this environment is built off of
  config.vm.box = 'precise32'

  # the url from where to fetch the base box if it doesn't exist
  config.vm.box_url = 'http://files.vagrantup.com/precise32.box'

  # attach network adapters
  config.vm.network :hostonly, '33.33.33.20', {:adapter => 2}

  # use puppet to provision packages
  config.vm.provision :puppet do |puppet|
    puppet.manifests_path = 'puppet/manifests'
    puppet.manifest_file = 'solr.pp'
    puppet.module_path = 'puppet/modules'
    puppet.facter = facter
  end
end