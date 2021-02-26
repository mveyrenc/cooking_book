module ApplicationFormBuilder
  module Inputs
    module Selects
      module Select
        extend ActiveSupport::Concern
        extend BulmaFormBuilder::Inputs::Select

        include Base

        included do
          def select_with_application(method, choices = nil, options = {}, html_options = {}, &block)
            select_with_bulma(method, choices, select_options(options, html_options), select_html_options(options, html_options), &block)
          end

          application_alias(:select)
        end
      end
    end
  end
end
