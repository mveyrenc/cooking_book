module Recipes
  module Parts
    class GeneralInformationComponent < BaseComponent

      def render?
        !object.times.blank?
      end

    end
  end
end