class WelcomeController < ApplicationController
  
  def index
    @recipes = (can? :read, Recipe) ? Recipe.all.order( 'created_at DESC' ).limit( 15 ) : []
  end

end
