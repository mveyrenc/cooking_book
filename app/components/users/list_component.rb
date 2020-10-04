module Users
  class ListComponent < ViewComponent::Base
    def initialize(items:)
      @objects = items
    end

    private

    attr_reader :objects
  end
end