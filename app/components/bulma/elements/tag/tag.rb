module Bulma
  module Elements
    module Tag
      class Tag < ActionView::Component::Base
        include Bulma::Component

        def initialize(
            styles: {}
        )
          self.styles = styles
        end

        private

        def default_css_classes
          ['tag']
        end
      end
    end
  end
end