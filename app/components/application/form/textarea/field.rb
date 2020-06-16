module Application
  module Form
    module Textarea
      class Field < ViewComponent::Base
        include Application::Form::FieldBase

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
end