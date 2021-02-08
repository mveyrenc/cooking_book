module Application
  module Elements
    class TagComponent < ViewComponent::Base
      include Application::Component

      def initialize(
        styles: {}
      )
        self.styles = styles
        compute_styles
      end

      def call
        content_tag :span, { :class => css_class } do
          content
        end
      end

      private

      def default_css_classes
        ['tag']
      end
    end
  end
end