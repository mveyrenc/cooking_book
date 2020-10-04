module Recipes
  class SearchFormComponent < ViewComponent::Base
    include BookColorable

    def initialize(book:, search_params:)
      @book = book
      @search_params = search_params
    end

    private

    attr_reader :book
    attr_reader :search_params
  end
end