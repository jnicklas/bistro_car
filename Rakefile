require 'rubygems'
gem 'hoe', '>= 2.1.0'
require 'hoe'
require 'fileutils'
require './lib/bistro_car'

Hoe.plugin :newgem

Hoe.spec 'bistro_car' do
  self.developer 'Jonas Nicklas', 'jonas.nicklas@gmail.com'
  self.post_install_message = 'PostInstall.txt' # TODO remove if post-install message not required
  self.rubyforge_name       = self.name # TODO this is default value
  self.extra_deps         = [['coffee-script','>= 0.1.6']]
  self.version = BistroCar::VERSION
end