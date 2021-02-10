module Recipes
  module Parts
    class SuggestionsComponent < BaseComponent

      def render?
        !object.wine.blank?
      end

    end
  end
end