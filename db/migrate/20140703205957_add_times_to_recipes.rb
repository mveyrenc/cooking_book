class AddTimesToRecipes < ActiveRecord::Migration[6.0]
  def change
    add_column :recipes, :times, :text
  end
end
