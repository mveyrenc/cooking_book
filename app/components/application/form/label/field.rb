module Application
  module Form
    module Label
      class Field < ViewComponent::Base
        include Application::Form::FieldBase

        def initialize(*args)
          initialize_field(**args.extract_options!)
        end

        private

        attr_reader :text

        def initialize_options(options)
          @text = options.fetch(:text, nil)
          super(options)
        end

        def default_html_options
          default_options = {class: "label"}
          default_options[:class] = default_options[:class] + " is-required" if is_required
          default_options
        end
      end
    end
  end
end