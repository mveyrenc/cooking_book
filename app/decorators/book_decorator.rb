class BookDecorator < Draper::Decorator
  delegate_all

  def categorizations
    object.categorizations.ordered
  end
end