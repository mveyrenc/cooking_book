module Recipes
  module Import
    class FormComponent < ApplicationComponent
      include BookColorableConcern

      def initialize(book:, object:, url:)
        @book = book
        @object = object
        @url = url
      end

      private

      attr_reader :book
      attr_reader :object
      attr_reader :url
    end
  end
end