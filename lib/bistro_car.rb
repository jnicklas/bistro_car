require 'jsmin'
require 'tempfile'
require 'bistro_car/bundle'
require 'bistro_car/helpers'

module BistroCar
  VERSION = "0.2.2"

  if defined?(Rails::Engine)
    class Engine < Rails::Engine
      engine_name :bistro_car
    end
  end
  
  class << self
    def compile(source)
      file = Tempfile.new('script.coffee')
      file.write(source)
      file.close
      %x(coffee -p #{file.path})
    end
  
    attr_accessor :mode, :minify
  end
end

BistroCar.mode = :bundled
BistroCar.minify = true if defined?(Rails) and Rails.env.production?
