class AddCategoriesToRecipes < ActiveRecord::Migration[6.0]
  def change
    create_join_table :recipes, :categories
  end
end
