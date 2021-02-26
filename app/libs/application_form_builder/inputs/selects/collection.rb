module ApplicationFormBuilder
  module Inputs
    module Selects
      module Collection
        extend ActiveSupport::Concern

        include Base

        included do
          def collection_select_with_application(method, collection, option_key_method, option_value_method, options = {}, html_options = {})
            form_field_builder(method, options, div_classes(options, html_options)) do
              content_tag(:div, class: 'select') do
                collection_select_without_application(method, collection, option_key_method, option_value_method, select_options(options, html_options), select_html_options(options, html_options))
              end
            end
          end

          application_alias(:collection_select)
        end
      end
    end
  end
end
