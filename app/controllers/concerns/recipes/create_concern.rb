module Recipes::CreateConcern
  extend ActiveSupport::Concern

  included do
    def do_new
      render new_component
    end

    def do_create
      @recipe = Recipe.new(create_recipe_params)

      @recipe.book = @book
      @recipe.author = current_user
      @recipe.modifier = current_user

      if @recipe.save
        redirect_to edit_book_recipe_path(@book, @recipe), flash: { notice: t('.success') }
      else
        render new_component
      end
    end

    private

    def create_recipe_params
      params.require(:recipe).permit(
        :name,
        :description,
        :wine,
        )
    end

    def new_component
      Recipes::Views::NewComponent.new(object: @recipe, part: @part)
    end
  end
end