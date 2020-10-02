class WelcomeController < ApplicationController
  
  def index
    redirect_to Book::COOKING
  end

end
