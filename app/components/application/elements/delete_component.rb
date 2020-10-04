module Application
  module Elements
    class DeleteComponent < ViewComponent::Base
      include Application::Component

      def initialize(
          styles: {}
      )
        self.styles = styles
        compute_styles
      end

      private

      def default_css_classes
        ['delete']
      end
    end
  end
end