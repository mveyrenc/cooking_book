class AddCostToRecipes < ActiveRecord::Migration[6.0]
  def self.up
    add_column :recipes, :cost, :integer, :default => 0
  end
  
  def self.down
    remove_column :recipes, :cost
  end
end
