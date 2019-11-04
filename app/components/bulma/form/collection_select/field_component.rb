module Bulma
  module Form
    module CollectionSelect
      class FieldComponent < ActionView::Component::Base
        include Bulma::Form::Field

        validates :form, :method, :choices, :value_method, :text_method, presence: true

        def initialize(
            form:,
            method:,
            choices:,
            value_method:,
            text_method:,
            resource: nil,
            options: {},
            html_options: {}
        )
          initialize_field(
              form: form,
              method: method,
              resource: resource,
              options: options,
              html_options: html_options
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