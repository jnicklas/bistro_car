require 'jsmin'
require 'bistro_car/bundle'
require 'bistro_car/helpers'

module BistroCar
  VERSION = "0.1.1"
  
  class << self
    attr_accessor :mode, :minify
  end
end

BistroCar.mode = :bundled
BistroCar.minify = true if defined?(Rails) and Rails.env.production?
