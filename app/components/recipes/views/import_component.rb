module Recipes
  module Views
    class ImportComponent < ViewComponent::Base
      include BookColorable

      def initialize(book:, url:, object:)
        @book = book
        @url = url
        @object = object
      end

      private

      attr_reader :book
      attr_reader :url
      attr_reader :object
    end
  end
end