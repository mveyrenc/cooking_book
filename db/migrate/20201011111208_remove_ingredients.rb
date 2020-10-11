class RemoveIngredients < ActiveRecord::Migration[6.0]
  def change
    drop_join_table :recipes, :ingredients
    drop_table :ingredients
  end
end
