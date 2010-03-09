module BistroCar
  class Bundle
    attr_reader :name, :view
    
    def initialize(view, name)
      @view = view
      @name = name.to_sym
    end
    
    def file_paths
      Dir.glob(path.join('*.coffee')).to_a
    end
    
    def render(mode)
      __send__("render_#{mode}")
    end
    
    def to_javascript
      minify(file_paths.map { |path| CoffeeScript.compile(File.read(path)) }.join)
    end

  private
  
    def minify(javascript)
      if BistroCar.minify then JSMin.minify(javascript) else javascript end
    end
  
    def javascript_url
      "/javascripts/bundle/#{name}.js"
    end
    
    def render_bundled
      view.content_tag(:script, '', :src => javascript_url, :type => 'text/javascript', :charset => 'utf-8')
    end

    def render_inline
      view.content_tag(:script, <<-JAVASCRIPT, :type => 'text/javascript', :charset => 'utf-8')
        //<![CDATA[
          #{to_javascript}
        //]]>
      JAVASCRIPT
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
