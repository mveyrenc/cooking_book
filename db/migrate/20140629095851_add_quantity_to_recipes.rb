class AddQuantityToRecipes < ActiveRecord::Migration
  def change
    add_column :recipes, :quantity, :string
  end
end
