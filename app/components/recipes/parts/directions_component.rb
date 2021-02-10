module Recipes
  module Parts
    class DirectionsComponent < BaseComponent

      def render?
        !object.directions.blank?
      end

    end
  end
end