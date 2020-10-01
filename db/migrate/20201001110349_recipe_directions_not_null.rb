class RecipeDirectionsNotNull < ActiveRecord::Migration[6.0]
  def change
    change_column :recipes, :directions, :text, :null => true
  end
end
