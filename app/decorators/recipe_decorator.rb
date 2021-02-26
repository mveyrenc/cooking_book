class RecipeDecorator < Draper::Decorator
  delegate_all

  def color
    book.color unless book.nil?
  end

  def self.collection_decorator_class
    PaginatingDecorator
  end
end