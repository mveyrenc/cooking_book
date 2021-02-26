module Application
  module Elements
    class FontAwesomeIconComponent < ApplicationComponent
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