Vagrant::Config.run do |config|
  config.vm.host_name = 'solr'

  # the base box this environment is built off of
  config.vm.box = 'precise32'

  # the url from where to fetch the base box if it doesn't exist
  config.vm.box_url = 'http://files.vagrantup.com/precise32.box'

  # attach network adapters
  config.vm.network :hostonly, '33.33.33.20', {:adapter => 2}

  # use puppet to provision packages, set a fact to indicate which contrib
  # module to support

  config.vm.define :searchapi, {:primary => true} do |searchapi|
    searchapi.vm.provision :puppet do |puppet|
      puppet.manifests_path = 'puppet/manifests'
      puppet.manifest_file = 'solr.pp'
      puppet.module_path = 'puppet/modules'
      puppet.facter = {'drupalsolrmodule' => 'search_api'}
    end
  end

  config.vm.define :apachesolr do |apachesolr|
    apachesolr.vm.provision :puppet do |puppet|
      puppet.manifests_path = 'puppet/manifests'
      puppet.manifest_file = 'solr.pp'
      puppet.module_path = 'puppet/modules'
      puppet.facter = {'drupalsolrmodule' => 'apachesolr'}
    end
  end
end