module Application
  module Form
    class EmailFieldComponent < ViewComponent::Base
      include Application::Form::FieldBaseComponent

      def initialize(*args)
        initialize_field(**args.extract_options!)
      end

      def default_html_options
        merge_options(super, {class: 'input'})
      end

      def call
        form.email_field method.to_sym, html_options
      end
    end
  end
end