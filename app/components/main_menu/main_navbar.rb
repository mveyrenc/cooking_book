module MainMenu
  class MainNavbar < ActionView::Component::Base
    include Devise::Controllers::Helpers
    include CanCan::ControllerAdditions

    def initialize(*)
    end
  end
end