module Recipes
  class NavigationComponent < ViewComponent::Base
    include ActionController::Helpers
    include Devise::Controllers::Helpers
    include CanCan::ControllerAdditions
    include BookColorable

    def initialize(book:)
      @book = book
    end

    private

    attr_reader :book
  end
end