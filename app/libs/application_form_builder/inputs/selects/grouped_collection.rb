module ApplicationFormBuilder
  module Inputs
    module Selects
    module GroupedCollection
      extend ActiveSupport::Concern

      include Base

      included do
        def grouped_collection_select_with_application(method, collection, group_method, group_label_method, option_key_method, option_value_method, options = {}, html_options = {})
          form_field_builder(method, options, html_options) do
            content_tag(:div, class: div_classes(options, html_options)) do
              grouped_collection_select_without_application(method, collection, group_method, group_label_method, option_key_method, option_value_method, select_options(options, html_options), select_html_options(options, html_options))
            end
          end
        end

        application_alias(:grouped_collection_select)
      end
    end
    end
  end
end
