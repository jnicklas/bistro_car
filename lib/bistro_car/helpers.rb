module BistroCar
  module Helpers
    def coffee_script_bundle(*bundles)
      options = bundles.extract_options!
      options[:mode] ||= BistroCar.mode
      [:default, *bundles].map { |name| Bundle.new(self, name).render(options[:mode]) }.join.try(:html_safe)
    end
    
    def coffee_script(&block)
      output = BistroCar.compile(capture(&block))
      
      concat content_tag(:script, <<-JAVASCRIPT, :type => 'text/javascript', :charset => 'utf-8')
        //<![CDATA[
          #{output}
        //]]>
      JAVASCRIPT
    end

  end
end

ActionView::Base.send(:include, BistroCar::Helpers) if defined?(ActionView::Base)
