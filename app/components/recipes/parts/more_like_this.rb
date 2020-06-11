module Recipes
  module Parts
    class MoreLikeThis < ViewComponent::Base

      def initialize(object:)
        @object = object
      end

      def render?
        items.any?
      end

      private

      attr_reader :object

      def items
        @items ||= object.similar(fields: [:ingredients, :name, :tags], limit: 5)
      end
    end
  end
end