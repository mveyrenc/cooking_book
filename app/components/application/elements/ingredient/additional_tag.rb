module Application
  module Elements
    module Ingredient
      class AdditionalTag < ViewComponent::Base
        def initialize(ingredient:)
          @ingredient = ingredient
        end

        private

        attr_reader :ingredient
      end
    end
  end
end