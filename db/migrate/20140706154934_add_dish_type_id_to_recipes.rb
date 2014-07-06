class AddDishTypeIdToRecipes < ActiveRecord::Migration
  def change
    add_column :recipes, :dish_type_id, :integer
    add_index  :recipes, :dish_type_id
  end
end
