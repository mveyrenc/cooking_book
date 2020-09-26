module Application
  module Elements
    class MarkdownComponent < ViewComponent::Base

      require 'commonmarker'

      def initialize(text:)
        @text = text
      end

      def render?
        !text.blank?
      end

      def call
        raw(CommonMarker.render_html(text, :DEFAULT))
      end

      private

      attr_reader :text

    end
  end
end