module Application
  module Elements
    class CategoryTagListComponent < ApplicationComponent
      def initialize(
        categories:,
        extra_categories: [],
        display_if_empty: false
      )
        @categories = categories
        @extra_categories = extra_categories
        @display_if_empty = display_if_empty
      end

      def render?
        display_if_empty or categories.any?
      end

      private

      attr_reader :categories
      attr_reader :extra_categories
      attr_reader :display_if_empty
    end
  end
end