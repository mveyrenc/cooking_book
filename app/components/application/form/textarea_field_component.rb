module Application
  module Form
    class TextareaFieldComponent < ViewComponent::Base
      include Application::Form::FieldBaseComponent

      def initialize(*args)
        initialize_field(**args.extract_options!)
      end

      def call
        form.text_area method.to_sym, html_options
      end

      def default_html_options
        merge_options(super, {class: 'textarea', rows: 2})
      end
    end
  end
end