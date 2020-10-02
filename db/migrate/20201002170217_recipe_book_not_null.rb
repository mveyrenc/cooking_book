class RecipeBookNotNull < ActiveRecord::Migration[6.0]
  def change
    change_column :recipes, :book_id, :bigint, :null => false
  end
end
