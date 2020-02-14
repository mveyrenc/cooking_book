module Bulma
  module Elements
    module Tag
      class Tag < ActionView::Component::Base
        include Stylable
        include Bulma::Color

        def initialize(
            is_light: nil,
            color: nil
        )
          self.is_light = is_light
          self.main_color = color
        end

        private

        def default_styles
          ['tag']
        end
      end
    end
  end
end