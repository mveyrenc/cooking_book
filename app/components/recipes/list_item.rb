module Recipes
  class ListItem < ActionView::Component::Base
    validates :item, presence: true

    def initialize(item:)
      @item = item
    end

    private

    attr_reader :item
  end
end