module Books
  module Views
    class ShowComponent < ApplicationComponent
      include BookColorableConcern

      def initialize(book:, recipes:)
        @book = book
        @recipes = recipes
      end

      private

      attr_reader :book
      attr_reader :recipes
    end
  end
end