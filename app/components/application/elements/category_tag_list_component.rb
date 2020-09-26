module Application
  module Elements
    class CategoryTagListComponent < ViewComponent::Base
      def initialize(
          categories:,
          extra_categories: []
      )
        @categories = categories
        @extra_categories = extra_categories
      end

      def render?
        categories.any?
      end

      private

      attr_reader :categories
      attr_reader :extra_categories
    end
  end
end