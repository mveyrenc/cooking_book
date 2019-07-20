class AddQuantityToRecipes < ActiveRecord::Migration[6.0]
  def change
    add_column :recipes, :quantity, :string
  end
end
