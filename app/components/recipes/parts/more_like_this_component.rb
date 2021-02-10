module Recipes
  module Parts
    class MoreLikeThisComponent < BaseComponent

      def render?
        objects.any?
      end

      private

      def objects
        @objects ||= object.similar(
            fields: [:ingredients, :name, :tags],
            where: {book_id: object.book.id},
            limit: 5)
      end
    end
  end
end