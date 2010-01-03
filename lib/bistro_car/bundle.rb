module BistroCar
  class Bundle
    attr_reader :name
    
    def initialize(name)
      @name = name.to_sym
    end
    
    def file_paths
      Dir.glob(path.join('*.coffee')).to_a
    end
    
    def render(mode)
      __send__("render_#{mode}")
    end
    
    def to_javascript
      file_paths.map { |path| CoffeeScript.compile(File.read(path)) }.join
    end

  private
  
    def javascript_url
      "/javascripts/bundle/#{name}.js"
    end
    
    def render_bundled
      %(<script src="#{javascript_url}" type="text/javascript" charset="utf-8"></script>)
    end

    def render_inline
      <<-HTML
        <script type="text/javascript" charset="utf-8">
        //<![CDATA[
          #{to_javascript}
        //]]>
        </script>
      HTML
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