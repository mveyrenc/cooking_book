module Users
  class ListItemComponent < ApplicationComponent
    def initialize(object:)
      @object = object
    end

    private

    attr_reader :object
  end
end