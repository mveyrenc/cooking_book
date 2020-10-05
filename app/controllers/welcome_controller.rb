class WelcomeController < ApplicationController
  
  def index
    redirect_to book_recipes_path(Book::COOKING)
  end

end
