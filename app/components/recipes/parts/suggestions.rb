module Recipes
  module Parts
    class Suggestions < ViewComponent::Base

      def initialize(object:)
        @object = object
      end

      def render?
        !@object.wine.blank?
      end

      private

      attr_reader :object
    end
  end
end