module Recipes::UpdateConcern
  extend ActiveSupport::Concern

  included do
    def update_recipe
      @recipe.modifier = current_user
      @recipe.book = @book

      respond_to do |format|
        if @recipe.update(update_recipe_params)
          format.html { render :edit, notice: t('.success') }
          format.json { render :show, status: :ok, location: @recipe }
        else
          format.html { render :edit }
          format.json { render json: @recipe.errors, status: :unprocessable_entity }
        end
      end
    end

    def update_recipe_params
      params.require(:recipe).permit(
        :name,
        { :category_ids => [] },
        :description,
        :picture,
        :times,
        :quantity,
        :ingredients,
        :directions,
        :wine,
        :difficulty,
        :cost
      )
    end
  end
end