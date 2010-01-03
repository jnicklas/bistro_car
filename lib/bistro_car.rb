require 'coffee-script'
require 'bistro_car/bundle'
require 'bistro_car/helpers'

module BistroCar
  VERSION = "0.1"
  
  class << self
    attr_accessor :mode
  end
end

BistroCar.mode = :bundled