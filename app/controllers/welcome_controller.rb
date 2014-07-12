class WelcomeController < ApplicationController
  
  def index
    @recipes = Recipe.all.order( 'created_at DESC' ).limit( 10 )
  end

end
