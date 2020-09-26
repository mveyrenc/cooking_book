module Application
  module Form
    module Markdown
      class Field < ViewComponent::Base
        include Application::Form::FieldBase

        def initialize(*args)
          initialize_field(**args.extract_options!)
        end

        def default_html_options
          merge_options(super, {
              class: 'markdown-editor',
              rows: 2,
              'data-controller': "application--form--markdown--field"
          })
        end
      end
    end
  end
end