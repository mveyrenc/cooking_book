module MainMenu
  class NavbarItem < ViewComponent::Base
    def initialize(title:, path:)
      @title = title
      @path = path
    end

    private

    attr_reader :title
    attr_reader :path

    def css_class
      css_class = "navbar-item"
      if current_page?(path)
        css_class += " is-active"
      end
      css_class
    end
  end
end