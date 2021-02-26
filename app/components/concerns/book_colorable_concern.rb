module BookColorableConcern
  extend ActiveSupport::Concern

  included do
    private

    attr_reader :object

    def css_book_color
      "is-#{book_color}"
    end

    def text_book_color
      "has-text-#{book_color}"
    end

    def book_color
      object.methods.include?(:color) ? object.color : 'primary'
    end
  end

end