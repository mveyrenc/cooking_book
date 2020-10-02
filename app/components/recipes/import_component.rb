module Recipes
  class ImportComponent < ViewComponent::Base
    def initialize(book:, item:, url:)
      @book = book
      @item = item
      @url = url
    end

    private

    attr_reader :book
    attr_reader :item
    attr_reader :url
  end
end