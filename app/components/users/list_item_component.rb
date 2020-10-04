module Users
  class ListItemComponent < ViewComponent::Base
    def initialize(item:)
      @object = item
    end

    private

    attr_reader :object
  end
end