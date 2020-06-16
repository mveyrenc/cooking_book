module Application
  module Form
    module Password
      class Field < ViewComponent::Base
        include Application::Form::FieldBase

        def initialize(*args)
          initialize_field(**args.extract_options!)
        end

        def default_html_options
          merge_options(super, {class: 'input'})
        end
      end
    end
  end
end