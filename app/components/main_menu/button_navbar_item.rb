module MainMenu
  class ButtonNavbarItem < ViewComponent::Base
    def initialize(title:, path:)
      @title = title
      @path = path
    end

    private

    attr_reader :title
    attr_reader :path
  end
end