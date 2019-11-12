module Users
  class FormComponent < ActionView::Component::Base
    def initialize(item:)
      @item = item
    end

    private

    attr_reader :item
  end
end