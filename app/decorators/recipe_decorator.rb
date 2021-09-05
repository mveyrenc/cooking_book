class RecipeDecorator < Draper::Decorator
  include BookableConcern

  delegate_all

  def self.collection_decorator_class
    PaginatingDecorator
  end
end