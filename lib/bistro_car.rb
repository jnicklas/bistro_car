require 'coffee-script'

module BistroCar
  
  VERSION = "0.1"
  
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
  
  
  module Helpers
    def coffee_script_bundle(*bundles)
      [:default, *bundles].map { |name| Bundle.new(name).render(:bundled) }.join
    end
    
    def coffee_script(&block)
      input = realign_indentation(capture(&block))
      output = CoffeeScript.compile(input)
      
      concat <<-HTML
        <script type="text/javascript" charset="utf-8">
        //<![CDATA[
          #{output}
        //]]>
        </script>
      HTML
    end

  private

    def realign_indentation(string)
      lines = string.split(/[\n\r]+/).select(&:present?)
      basis = lines.first.index(/\S/) # find the first non-whitespace character
      return lines.map { |s| s.sub(/^\s{#{basis}}/, '') }.join("\n")
    end

  end
end

ActionView::Base.send(:include, BistroCar::Helpers) if defined?(ActionView::Base)