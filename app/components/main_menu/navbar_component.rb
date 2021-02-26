module MainMenu
  class NavbarComponent < ApplicationComponent
    include Devise::Controllers::Helpers

    def initialize(request:)
      @request = request
    end

    private

    attr_reader :request
  end
end