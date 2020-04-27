module Bulma
  module Form
    module Text
      class Field < ViewComponent::Base
        include Bulma::Form::FieldBase

        def initialize(*args)
          initialize_field(args.extract_options!)
        end

        def default_html_options
          merge_options(super, {class: 'input'})
        end
      end
    end
  end
end