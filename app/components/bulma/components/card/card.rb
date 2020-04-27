module Bulma
  module Components
    module Card
      class Card < ViewComponent::Base
        include Bulma::Component

        with_content_areas :header, :image, :body, :footer

        private

        def default_css_classes
          ['card']
        end
      end
    end
  end
end