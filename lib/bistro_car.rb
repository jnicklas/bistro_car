require 'jsmin'
require 'bistro_car/bundle'
require 'bistro_car/helpers'

module BistroCar
  VERSION = "0.1.1"

  if defined?(Rails::Engine)
    class Engine < Rails::Engine
      engine_name :bistro_car
    end
  end
  
  class << self
    attr_accessor :mode, :minify
  end
end

BistroCar.mode = :bundled
BistroCar.minify = true if defined?(Rails) and Rails.env.production?
