class RemoveDishTypeFromRecipes < ActiveRecord::Migration[6.0]
  def change
    drop_table :dish_types
  end
end
