module Application
  module Components
    class CardComponent < ViewComponent::Base
      include Application::Component

      with_content_areas :header, :image, :body, :footer

      private

      def default_css_classes
        ['card']
      end
    end
  end
end