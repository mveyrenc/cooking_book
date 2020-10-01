module Recipes
  class ImportComponent < ViewComponent::Base
    def initialize(item:, url:)
      @item = item
      @url = url
    end

    private

    attr_reader :item
    attr_reader :url
  end
end