module Application
  module Elements
    class NotificationComponent < ApplicationComponent

      def initialize(
        color: :primary,
        delete: true
      )
        @color = color
        @delete = delete
      end

      private

      attr_reader :color
      attr_reader :delete

      alias :delete? :delete

      def stimulus_controller
        "application--elements--notification"
      end

      def default_css_classes
        ['notification', "is-#{color}"]
      end
    end
  end
end