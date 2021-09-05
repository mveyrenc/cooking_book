class CategoryDecorator < Draper::Decorator
  include BookableConcern

  delegate_all

  decorates_association :related_tree_categories
  decorates_association :related_tree_by_categories
  decorates_association :related_categories
  decorates_association :related_by_categories
  decorates_association :extra_related_categories
  decorates_association :suggested_categories

  def book_name
    Category.human_enum_name(:book, book)
  end

  def categorization_name
    Category.human_enum_name(:categorization, categorization)
  end

  def self.collection_decorator_class
    PaginatingDecorator
  end
end