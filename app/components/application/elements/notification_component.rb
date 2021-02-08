module Application
  module Elements
    class NotificationComponent < ViewComponent::Base
      include Application::Component

      def initialize(
        styles: {},
        delete: true,
        delete_styles: {}
      )
        @delete = delete
        @delete_styles = delete_styles

        self.styles = styles
        compute_styles
      end

      private

      attr_reader :delete
      attr_reader :delete_styles

      alias :delete? :delete

      def stimulus_controller
        "application--elements--notification"
      end

      def default_css_classes
        ['notification']
      end
    end
  end
end