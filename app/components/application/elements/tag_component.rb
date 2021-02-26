module Application
  module Elements
    class TagComponent < ApplicationComponent

      def initialize(
        colors: []
      )
        @colors = colors
      end

      def call
        content_tag :span, { class: css_class } do
          content
        end
      end

      private

      attr_reader :colors

      def default_css_classes
        ['tag'] + colors.map{ |c| "is-#{c}" }
      end
    end
  end
end