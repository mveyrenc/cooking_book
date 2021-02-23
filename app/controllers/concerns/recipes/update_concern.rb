module Recipes::UpdateConcern
  extend ActiveSupport::Concern

  included do
    def do_edit
      render edit_component
    end

    def update_recipe
      @recipe.modifier = current_user
      @recipe.book = @book

      if @recipe.update(update_recipe_params)
        render edit_component, notice: t('.success')
      else
        render edit_component
      end
    end

    private

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

    def edit_component
      Recipes::Views::EditComponent.new(object: @recipe, part: @part)
    end
  end
end