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

      output = %x(coffee -p #{file.path} 2>&1)
      if $? == 0
        output
      else
        clean_output = output.gsub(/[\\"]/){|m| "\\#{m}" }.gsub(/\n/){|m| '\n' }
        %Q[if (console && console.error) console.error("#{clean_output}");]
      end
    end
  
    attr_accessor :mode, :minify
  end
end

BistroCar.mode = :bundled
BistroCar.minify = true if defined?(Rails) and Rails.env.production?
