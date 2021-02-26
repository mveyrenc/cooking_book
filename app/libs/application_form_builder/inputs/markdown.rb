module ApplicationFormBuilder
  module Inputs
    module Markdown
      extend ActiveSupport::Concern
      
      include Base

      included do
        def markdown(name, options = {})
            options['data-controller'] = "markdown" unless options.key? 'data-controller'
            text_area(name, options)
        end

      end
    end
  end
end
