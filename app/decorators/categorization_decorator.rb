class CategorizationDecorator < Draper::Decorator
  delegate_all

  def color
    book.color unless book.nil?
  end
end