class RemoveDishTypeFromRecipes < ActiveRecord::Migration
  def change
    drop_table :dish_types
  end
end
