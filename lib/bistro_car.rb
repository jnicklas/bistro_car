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
      %x(#{full_coffee_path} -p #{file.path})
    end

    def full_coffee_path
      @full_coffee_path ||= File.join(*[BistroCar.path, 'coffee'].compact)
    end

    attr_accessor :mode, :minify, :path
  end
end

BistroCar.mode = :bundled
BistroCar.minify = true if defined?(Rails) and Rails.env.production?
BistroCar.path = nil
