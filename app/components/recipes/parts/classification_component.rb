module Recipes
  module Parts
    class ClassificationComponent < ViewComponent::Base
      include BookColorable

      def initialize(object:)
        @object = object
      end

      def render?
        categories.render?
      end

      private

      attr_reader :object

      def categories
        @categories ||= Application::Elements::CategoryTagListComponent.new(
            categories: object.categories,
            extra_categories: object.additional_categories
        )
      end
    end
  end
end