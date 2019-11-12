module MainMenu
  class ButtonNavbarItem < ActionView::Component::Base
    validates :title, :path, presence: true

    def initialize(title:, path:)
      @title = title
      @path = path
    end

    private

    attr_reader :title
    attr_reader :path
  end
end