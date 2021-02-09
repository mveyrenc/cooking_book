module Recipes::CreateConcern
  extend ActiveSupport::Concern

  included do
    def create_recipe
      @recipe = Recipe.new(create_recipe_params)

      @recipe.book = @book
      @recipe.author = current_user
      @recipe.modifier = current_user

      respond_to do |format|
        if @recipe.save
          format.html { redirect_to edit_book_recipe_path(@book, @recipe), notice: t('.success') }
          format.json { render :show, status: :created, location: @recipe }
        else
          format.html { render :new }
          format.json { render json: @recipe.errors, status: :unprocessable_entity }
        end
      end
    end

    def create_recipe_params
      params.require(:recipe).permit(
          :name,
          :description,
          :wine,
      )
    end
  end
end