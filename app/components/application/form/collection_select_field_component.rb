module Application
  module Form
    class CollectionSelectFieldComponent < ViewComponent::Base
      include Application::Form::FieldBaseComponent

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

      def default_html_options
        merge_options(super, {
            'data-controller': "application--form--collection-select-field"
        })
      end

      private

      attr_reader :choices
      attr_reader :value_method
      attr_reader :text_method
    end
  end
end