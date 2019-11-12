module Bulma
  module Form
    module CollectionSelect
      class Entry < ActionView::Component::Base
        include Bulma::Form::EntryBase

        validates :form, :method, :choices, :value_method, :text_method, presence: true

        def initialize(
            form:,
            method:,
            choices:,
            value_method:,
            text_method:,
            resource: nil,
            options: {},
            field_html_options: {},
            label_html_options: {}
        )
          initialize_entry(
              form: form,
              method: method,
              resource: resource,
              options: options,
              field_html_options: field_html_options,
              label_html_options: label_html_options
          )
          @choices = choices
          @value_method = value_method
          @text_method = text_method
        end

        private

        attr_reader :choices
        attr_reader :value_method
        attr_reader :text_method
      end
    end
  end
end