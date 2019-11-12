module Bulma
  module Form
    module Password
      class Field < ActionView::Component::Base
        include Bulma::Form::FieldBase

        validates :form, :method, presence: true

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