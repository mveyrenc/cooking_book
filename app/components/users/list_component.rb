module Users
  class ListComponent < ViewComponent::Base
    def initialize(items:)
      @items = items
    end

    private

    attr_reader :items
  end
end