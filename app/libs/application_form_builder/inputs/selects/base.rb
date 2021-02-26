module ApplicationFormBuilder
  module Inputs
    module Selects
      module Base

        include ApplicationFormBuilder::Inputs::Base

        private

        def div_classes(options, html_options)
          classes = ['select']
          classes <<= "is-multiple" if html_options[:multiple]
          classes
        end

        def select_options(options, html_options)
          options[:prompt] = true unless options.key? :prompt
          options
        end

        def select_html_options(options, html_options)
          # html_options['data-controller'] = "selectize" unless options.key? 'data-controller'

          html_options
        end
      end
    end
  end
end
