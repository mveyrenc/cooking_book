class BooksController < ApplicationController

  authorize_resource

  before_action :set_book, only: [:show]

  def show
    @recipes = (can? :read, Recipe) ? @book.recipes.order('created_at DESC').limit(15) : []
  end

  def set_book
    @book = Book.friendly.find(params[:id])
  end

end
