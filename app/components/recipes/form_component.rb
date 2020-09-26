module Recipes
  class FormComponent < ViewComponent::Base
    def initialize(item:)
      @item = item
    end

    private

    attr_reader :item
  end
end