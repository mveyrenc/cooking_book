module MainMenu::SideMenu
  class AdminMenuComponent < ApplicationComponent
    include ActionController::Helpers
    include Devise::Controllers::Helpers
    include CanCan::ControllerAdditions

    def render?
      can? :read, Category or can? :manage, User
    end
  end
end