module MainMenu::SideMenu
  class AdminMenuComponent < ViewComponent::Base
    include ActionController::Helpers
    include Devise::Controllers::Helpers
    include CanCan::ControllerAdditions

    def render?
      can? :read, Category or can? :manage, User
    end
  end
end