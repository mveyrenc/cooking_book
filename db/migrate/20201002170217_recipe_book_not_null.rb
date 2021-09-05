class RecipeBookNotNull < ActiveRecord::Migration[6.0]
  def change
    change_column :recipes, :book, :string, :null => false
  end
end
