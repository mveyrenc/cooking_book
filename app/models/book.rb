class Book

  COOKING = 'cooking'
  HEALTH_WELLNESS = 'health_wellness'
  HOUSE = 'house'

  BOOKS = [COOKING, HEALTH_WELLNESS, HOUSE]

  def initialize(book)
    @book = book
  end

  def eql?(other)
    to_s.eql?(other.to_s)
  end

  def to_s
    @book.to_s
  end

  def self.to_hash
    Hash[BOOKS.map { |x| [x.to_sym, x] }]
  end
end
