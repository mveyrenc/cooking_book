module Recipes
  module FormParts
    class DirectionsComponent < BaseComponent

      def render?
        !object.directions.blank?
      end

    end
  end
end