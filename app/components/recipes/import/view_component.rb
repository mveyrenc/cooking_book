module Recipes
  module Import
    class ViewComponent < ApplicationComponent
      include BookColorableConcern

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