module Recipes
  class Detail < ViewComponent::Base
    def initialize(object:)
      @object = object
    end

    private

    attr_reader :object
  end
end