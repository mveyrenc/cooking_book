module Application
  module Form
    class CollectionCheckboxesFieldComponent < ViewComponent::Base
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

      private

      attr_reader :choices
      attr_reader :value_method
      attr_reader :text_method

      def initialize_html_options(html_options)
        @html_options = merge_options(default_html_options, html_options)
        @html_options[:required] = false
      end

      def default_html_options
        merge_options(super, {class: 'is-checkradio'})
      end

    end
  end
end