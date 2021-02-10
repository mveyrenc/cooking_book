module Recipes
  module Parts
    class IngredientsComponent < BaseComponent

      def render?
        !object.ingredients.blank?
      end

    end
  end
end