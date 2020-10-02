module Recipes
  module Parts
    class MoreLikeThisComponent < ViewComponent::Base

      def initialize(object:)
        @object = object
      end

      def render?
        items.any?
      end

      private

      attr_reader :object

      def items
        @items ||= object.similar(
            fields: [:ingredients, :name, :tags],
            where: {book_id: object.book.id},
            limit: 5)
      end
    end
  end
end