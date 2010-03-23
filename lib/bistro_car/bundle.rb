module BistroCar
  class Bundle
    attr_reader :name
    
    def initialize(name)
      @name = name.to_sym
    end
    
    def file_paths
      Dir.glob(path.join('*.coffee')).to_a
    end
    
    def to_javascript
      minify(file_paths.map { |path| BistroCar.compile(File.read(path)) }.join)
    end

    def javascript_url
      "/javascripts/bundle/#{name}.js"
    end

  private

    def minify(javascript)
      if BistroCar.minify then JSMin.minify(javascript) else javascript end
    end
  
    def path
      if name == :default
        Rails.root.join('app/scripts')
      else
        Rails.root.join('app/scripts', name.to_s)
      end
    end
  end
end
