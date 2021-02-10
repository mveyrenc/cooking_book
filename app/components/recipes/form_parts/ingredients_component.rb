module Recipes
  module FormParts
    class IngredientsComponent < BaseComponent

      def render?
        !object.ingredients.blank?
      end

    end
  end
end