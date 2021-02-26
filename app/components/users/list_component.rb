module Users
  class ListComponent < ApplicationComponent
    def initialize(objects:)
      @objects = objects
    end

    private

    attr_reader :objects
  end
end