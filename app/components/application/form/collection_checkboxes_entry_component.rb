module Application
  module Form
    class CollectionCheckboxesEntryComponent < ViewComponent::Base
      include Application::Form::EntryBaseComponent

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