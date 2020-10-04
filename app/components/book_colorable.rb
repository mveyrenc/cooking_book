module BookColorable
  attr_reader :object
  attr_reader :book

  def css_book_color
    "is-#{book_color}" unless book_color.nil?
  end

  def text_book_color
    "has-text-#{book_color}" unless book_color.nil?
  end

  def book_color
    @book_color ||= find_book_color
  end

  private

  def find_book_color
    b = nil
    unless self.object.nil?
      if self.object.is_a?(Book)
        b = self.object
      elsif self.object.attributes.has_key?('book_id')
        b = self.object.book
      elsif self.object.attributes.has_key?('categorization_id') and self.object.categorization.present?
        b = self.object.categorization.book
      end
    end

    if b.nil?
      b = self.book
    end

    b.color unless b.nil?
  end
end