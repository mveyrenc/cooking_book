module Users
  class ListComponent < ViewComponent::Base
    def initialize(objects:)
      @objects = objects
    end

    private

    attr_reader :objects
  end
end