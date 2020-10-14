class BooksController < SecuredController

  authorize_resource

  before_action :set_book, only: [:show]

  def show
    breadcrumb I18n.t('breadcrumb.recipes'), book_path(@book)
    breadcrumb @book.name, book_path(@book)

    @recipes = (can? :read, Recipe) ? @book.recipes.order('created_at DESC').limit(15) : []
  end

  def set_book
    @book = Book.friendly.find(params[:id])
  end

end
