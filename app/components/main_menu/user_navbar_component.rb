module MainMenu
  class UserNavbarComponent < ActionView::Component::Base
    include Devise::Controllers::Helpers

    def initialize(*)
    end
  end
end