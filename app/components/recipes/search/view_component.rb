module Recipes
  module Search
    class ViewComponent < ApplicationComponent
      include BookColorableConcern

      def initialize(
          book:,
          search_params:,
          search_result:
      )
        @book = book
        @search_params = search_params
        @search_result = search_result
      end

      private

      attr_reader :book
      attr_reader :search_params
      attr_reader :search_result
    end
  end
end