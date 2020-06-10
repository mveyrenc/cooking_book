module Recipes
  class SearchForm < ViewComponent::Base
    def initialize(query:)
      @query = query
    end

    private

    attr_reader :query
  end
end