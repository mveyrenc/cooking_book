module Recipes
  module Parts
    class MoreLikeThisComponent < ViewComponent::Base
      include BookColorable

      def initialize(object:)
        @object = object
      end

      def render?
        objects.any?
      end

      private

      attr_reader :object

      def objects
        @objects ||= object.similar(
            fields: [:ingredients, :name, :tags],
            where: {book_id: object.book.id},
            limit: 5)
      end
    end
  end
end