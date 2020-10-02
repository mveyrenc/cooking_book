module MainMenu
  class AdminNavbarComponent < ViewComponent::Base
    include ActionController::Helpers
    include Devise::Controllers::Helpers
    include CanCan::ControllerAdditions

    def initialize(*) end

    def render?
      can? :read, Category or can? :read, Ingredient or can? :read, Source or can? :manage, User
    end
  end
end