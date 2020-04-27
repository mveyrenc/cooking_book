module FontAwesome
  class Icon < ViewComponent::Base
    def initialize(icon:)
      @icon = icon
    end

    private

    attr_reader :icon
  end
end