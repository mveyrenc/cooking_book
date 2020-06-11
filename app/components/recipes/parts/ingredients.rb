module Recipes
  module Parts
    class Ingredients < ViewComponent::Base

      def initialize(object:)
        @object = object
      end

      def render?
        !@object.ingredients.blank?
      end

      private

      attr_reader :object
    end
  end
end