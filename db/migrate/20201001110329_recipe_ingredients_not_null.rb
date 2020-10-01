class RecipeIngredientsNotNull < ActiveRecord::Migration[6.0]
  def change
    change_column :recipes, :ingredients, :text, :null => true
  end
end
