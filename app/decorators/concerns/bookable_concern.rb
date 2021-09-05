module BookableConcern
  extend ActiveSupport::Concern

  included do
    def color
      book ? book.sub('_', '-') : nil
    end
  end

end