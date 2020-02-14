module Application
  module Elements
    module Ingredient
      class AdditionalTag < ActionView::Component::Base
        def initialize(ingredient:)
          @ingredient = ingredient
        end

        private

        attr_reader :ingredient
      end
    end
  end
end