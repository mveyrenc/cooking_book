module Bulma
  module Form
    module CollectionSelect
      class Field < ViewComponent::Base
        include Bulma::Form::FieldBase

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