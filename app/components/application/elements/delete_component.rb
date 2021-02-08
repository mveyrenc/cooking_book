module Application
  module Elements
    class DeleteComponent < ViewComponent::Base
      include Application::Component

      def initialize(
        stimulus_controller:,
        styles: {}
      )
        @stimulus_controller = stimulus_controller

        self.styles = styles
        compute_styles
      end

      private

      attr_reader :stimulus_controller

      def default_css_classes
        ['delete']
      end
    end
  end
end