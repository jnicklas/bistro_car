module BistroCar
  module Helpers
    def coffee_script_bundle(*bundles)
      options = bundles.extract_options!
      options[:mode] ||= BistroCar.mode
      [:default, *bundles].map { |name| Bundle.new(self, name).render(options[:mode]) }.join.try(:html_safe)
    end
    
    def coffee_script(&block)
      input = realign_indentation(capture(&block))
      output = CoffeeScript.compile(input)
      
      content_tag(:script, <<-JAVASCRIPT, :type => 'text/javascript', :charset => 'utf-8')
        //<![CDATA[
          #{output}
        //]]>
      JAVASCRIPT
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
