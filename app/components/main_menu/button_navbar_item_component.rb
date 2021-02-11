module MainMenu
  class ButtonNavbarItemComponent < ViewComponent::Base

    def initialize(title:, path:, icon: nil, color: nil)
      @title = title
      @path = path
      @icon = icon
      @color = color
    end

    private

    attr_reader :title
    attr_reader :path
    attr_reader :icon
    attr_reader :color

    def css_class
      url_string = URI::DEFAULT_PARSER.unescape(url_for(path)).force_encoding(Encoding::BINARY)

      css_class = ["button is-large is-rounded"]
      unless color.nil?
        css_class << "is-#{Application::Color::COLORS[color][:class]}"
      end
      if current_page?(path) or request.env['PATH_INFO'].start_with? url_string
        css_class << "is-active"
      end
      css_class.join(' ')
    end
  end
end