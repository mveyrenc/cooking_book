module Users
  class List < ActionView::Component::Base
    def initialize(items:)
      @items = items
    end

    private

    attr_reader :items
  end
end