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
      # Return fast on empty source!
      return "" if source.blank?
      file = Tempfile.new('script.coffee')
      jsfile = "#{file.path}.js"
      file.write(source)
      file.close
      # Check for generated content, raise on empty output…
      if (content = %x(coffee -p #{file.path})).blank?
        raise CoffeeScriptCompileError.new(%x(coffee -p #{file.path} 2>&1))
      else
        content
      end
    end

    attr_accessor :mode, :minify
  end
  class CoffeeScriptCompileError < RuntimeError; end
end

BistroCar.mode = :bundled
BistroCar.minify = true if defined?(Rails) and Rails.env.production?
