module BistroCar
  module Helpers

    def coffee_script_bundle(*bundles)
      options = bundles.extract_options!
      options[:mode] ||= BistroCar.mode
      options[:default] = true unless options.has_key? :default
      
      bundles.unshift :default if options[:default]
      bundles.map! do |name|
        bundle = Bundle.new(name)
        render_cs_bundle(bundle, options[:mode])
      end.join
      bundles = bundles.html_safe if bundles.respond_to?(:html_safe)
      bundles
    end
    
    def coffee_script(options = { :wrap => true }, &block)
      output = BistroCar.compile(capture(&block))
      
      if options[:wrap]
        concat content_tag(:script, <<-JAVASCRIPT, :type => 'text/javascript', :charset => 'utf-8')
          //<![CDATA[
            #{output}
          //]]>
        JAVASCRIPT
      else
        concat output
      end
    end

  private

    def render_cs_bundle(bundle, mode)
      __send__("render_cs_bundle_#{mode}", bundle)
    end

    def render_cs_bundle_bundled(bundle)
      content_tag(:script, '', :src => bundle.javascript_url, :type => 'text/javascript', :charset => 'utf-8')
    end

    def render_cs_bundle_inline(bundle)
      content_tag(:script, <<-JAVASCRIPT.html_safe, :type => 'text/javascript', :charset => 'utf-8')
        //<![CDATA[
          #{bundle.to_javascript}
        //]]>
      JAVASCRIPT
    end

  end
end

ActionView::Base.send(:include, BistroCar::Helpers) if defined?(ActionView::Base)
