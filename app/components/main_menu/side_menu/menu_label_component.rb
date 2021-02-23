module MainMenu::SideMenu
  class MenuLabelComponent < ViewComponent::Base

    def initialize(title:, icon: nil, color: nil)
      @title = title
      @icon = icon
      @color = color
    end

    private

    attr_reader :title
    attr_reader :icon
    attr_reader :color

    def css_class
      css_class = ["menu-label is-size-5"]
      unless color.nil?
        css_class << "has-text-#{Application::Color::COLORS[color][:class]}"
      end
      css_class.join(' ')
    end
  end
end