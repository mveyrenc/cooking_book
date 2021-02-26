module Application
  module Elements
    class MarkdownComponent < ApplicationComponent

      require 'redcarpet'

      def initialize(text:)
        @text = text
        @markdown = Redcarpet::Markdown.new(
          Redcarpet::Render::HTML,
          autolink: true,
          tables: true,
          footnotes: true
        )
      end

      def render?
        !text.blank?
      end

      def call
        raw(@markdown.render(text))
      end

      private

      attr_reader :text

    end
  end
end