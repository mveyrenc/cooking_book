class AddDishTypeIdToRecipes < ActiveRecord::Migration[6.0]
  def change
    add_column :recipes, :dish_type_id, :integer
    add_index  :recipes, :dish_type_id
  end
end
