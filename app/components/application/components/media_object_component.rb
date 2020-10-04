module Application
  module Components
    class MediaObjectComponent < ViewComponent::Base
      include Application::Component

      with_content_areas :left, :body, :right

      private

      def default_css_classes
        ['media is-bordered']
      end
    end
  end
end