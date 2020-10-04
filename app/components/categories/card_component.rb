module Categories
  class CardComponent < ViewComponent::Base
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