module Elements
  class FontAwesomeIconComponent < ActionView::Component::Base
    validates :icon, presence: true

    def initialize(icon:)
      @icon = icon
    end

    private

    attr_reader :icon
  end
end