class AddTimesToRecipes < ActiveRecord::Migration
  def change
    add_column :recipes, :times, :text
  end
end
