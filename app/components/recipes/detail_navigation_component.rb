module Recipes
  class DetailNavigationComponent < ViewComponent::Base
    include ActionController::Helpers
    include Devise::Controllers::Helpers
    include CanCan::ControllerAdditions
    include BookColorable

    def initialize(object:)
      @object = object
    end

    private

    attr_reader :object
  end
end