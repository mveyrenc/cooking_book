module Bulma
  module Form
    module Image
      class Field < ViewComponent::Base
        include Bulma::Form::FieldBase

        def initialize(*args)
          initialize_field(args.extract_options!)
        end

        def default_html_options
          merge_options(super, {class: 'file-input'})
        end

        private

        def image
          @image ||= resource.send(method.to_sym)
        end

        def image?
          !image.nil?
        end
      end
    end
  end
end