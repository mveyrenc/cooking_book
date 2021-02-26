class CategoryDecorator < Draper::Decorator
  delegate_all

  decorates_association :related_tree_categories
  decorates_association :related_tree_by_categories
  decorates_association :related_categories
  decorates_association :related_by_categories
  decorates_association :extra_related_categories
  decorates_association :suggested_categories

  def book
    categorization.book unless categorization.nil?
  end

  def color
    book.color unless book.nil?
  end

  def self.collection_decorator_class
    PaginatingDecorator
  end
end