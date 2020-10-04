module Recipes
  class ImportComponent < ViewComponent::Base
    include BookColorable

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