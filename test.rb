require 'optparse'

options = {}

opt_parser = OptionParser.new do |opts|
  opts.banner = 'Usage: vagrant up [--searchapi|apachesolr]'

  opts.on('--searchapi') do
    options = "Drupal module: search_api"
  end

  opts.on('--apachesolr') do
    options = "Drupal module: apachesolr"
  end
end.parse!

puts options