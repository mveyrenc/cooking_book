module Application
  module Elements
    class DeleteComponent < ApplicationComponent

      def initialize(
        stimulus_controller:
      )
        @stimulus_controller = stimulus_controller
      end

      private

      attr_reader :stimulus_controller

      def default_css_classes
        ['delete']
      end
    end
  end
end