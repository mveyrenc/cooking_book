module Recipes
  module Parts
    class Classification < ViewComponent::Base

      def initialize(object:)
        @object = object
      end

      def render?
        sources.render? or categories.render? or ingredients.render?
      end

      private

      attr_reader :object

      def sources
        @sources ||= Application::Elements::CategoryTagListComponent.new(
            categories: object.sources_list
        )
      end

      def categories
        @categories ||= Application::Elements::CategoryTagListComponent.new(
            categories: object.categories,
            extra_categories: object.additional_categories
        )
      end

      def ingredients
        @ingredients ||= Application::Elements::CategoryTagListComponent.new(
            categories: object.main_ingredients,
            extra_categories: object.additional_main_ingredients
        )
      end
    end
  end
end