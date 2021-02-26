module Recipes
  module Search
    class FormComponent < ApplicationComponent
      include BookColorableConcern

      def initialize(book:, search_params:)
        @book = book
        @search_params = search_params
      end

      private

      attr_reader :book
      attr_reader :search_params
    end
  end
end