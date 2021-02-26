module MainMenu::SideMenu
  class MenuItemComponent < ApplicationComponent

    def initialize(title:, path:, color: nil)
      @title = title
      @path = path
      @color = color
    end

    private

    attr_reader :title
    attr_reader :path
    attr_reader :color
  end
end