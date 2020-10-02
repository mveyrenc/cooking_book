module Recipes
  class SearchFormComponent < ViewComponent::Base
    def initialize(book:, query:)
      @book = book
      @query = query
    end

    private

    attr_reader :book
    attr_reader :query
  end
end