module MainMenu
  class NavbarItemComponent < ViewComponent::Base
    def initialize(title:, path:, icon: nil)
      @title = title
      @path = path
      @icon = icon
    end

    private

    attr_reader :title
    attr_reader :path
    attr_reader :icon

    def css_class
      url_string = URI.parser.unescape(url_for(path)).force_encoding(Encoding::BINARY)

      css_class = "navbar-item"
      if current_page?(path) or request.env['PATH_INFO'].start_with? url_string
        css_class += " is-active"
      end
      css_class
    end
  end
end