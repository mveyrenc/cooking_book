module Application
  module Form
    class MarkdownFieldComponent < ViewComponent::Base
      include Application::Form::FieldBaseComponent

      def initialize(*args)
        initialize_field(**args.extract_options!)
      end

      def default_html_options
        merge_options(super, {
            class: 'markdown-editor',
            rows: 2,
            'data-controller': "application--form--markdown-field"
        })
      end

      def call
        form.text_area method.to_sym, html_options
      end
    end
  end
end