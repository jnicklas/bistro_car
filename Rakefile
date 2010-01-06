require 'rubygems'
gem 'hoe', '>= 2.1.0'
require 'hoe'
require 'fileutils'
$:.unshift(File.expand_path('./lib', File.dirname(__FILE__)))
require 'bistro_car'

Hoe.plugin :newgem

Hoe.spec 'bistro_car' do
  self.developer 'Jonas Nicklas', 'jonas.nicklas@gmail.com'
  self.post_install_message = 'PostInstall.txt' # TODO remove if post-install message not required
  self.rubyforge_name       = self.name # TODO this is default value
  self.extra_deps         = [
    ['coffee-script','>= 0.1.6'],
    ['jsmin','>= 1.0.1']
  ]
  self.version = BistroCar::VERSION
end