module Recipes
  module Parts
    class Directions < ViewComponent::Base

      def initialize(object:)
        @object = object
      end

      def render?
        !@object.directions.blank?
      end

      private

      attr_reader :object
    end
  end
end