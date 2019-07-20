class NotNullFieldInRecipes < ActiveRecord::Migration[6.0]
  def change
    change_column :recipes, :name, :string, :null => false
    change_column :recipes, :ingredients, :text, :null => false
    change_column :recipes, :directions, :text, :null => false
  end
end
