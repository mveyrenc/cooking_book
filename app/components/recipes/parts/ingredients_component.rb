module Recipes
  module Parts
    class IngredientsComponent < ViewComponent::Base
      include BookColorable

      def initialize(object:)
        @object = object
      end

      def render?
        !object.ingredients.blank?
      end

      private

      attr_reader :object
    end
  end
end