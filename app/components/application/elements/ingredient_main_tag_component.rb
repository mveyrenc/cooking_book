module Application
  module Elements
    class IngredientMainTagComponent < ViewComponent::Base
      def initialize(ingredient:)
        @ingredient = ingredient
      end

      private

      attr_reader :ingredient
    end
  end
end