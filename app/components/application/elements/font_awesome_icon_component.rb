module Application
  module Elements
    class Application::Elements::FontAwesomeIconComponent < ViewComponent::Base
      def initialize(icon:)
        @icon = icon
      end

      def call
        content_tag :i, nil, class: "fas fa-%s" % icon
      end

      private

      attr_reader :icon
    end
  end
end