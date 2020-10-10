module Recipes
  module Parts
    class ClassificationComponent < ViewComponent::Base
      include BookColorable

      def initialize(object:)
        @object = object
      end

      def render?
        categories.render? or ingredients.render?
      end

      private

      attr_reader :object

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