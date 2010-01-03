module BistroCar
  module Helpers
    def coffee_script_bundle(*bundles)
      options = bundles.extract_options!
      options[:mode] ||= :bundled
      [:default, *bundles].map { |name| Bundle.new(name).render(options[:mode]) }.join
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