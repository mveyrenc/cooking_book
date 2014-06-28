class WelcomeController < ApplicationController
  
  def index
    @recipes = Recipe.take(10)
  end

end
