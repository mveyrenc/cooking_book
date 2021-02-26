module Application
  module Components
    class CardComponent < ApplicationComponent

      with_content_areas :header, :image, :body, :footer

      private

      def default_css_classes
        ['card']
      end
    end
  end
end