class AddCostToRecipes < ActiveRecord::Migration
  def self.up
    add_column :recipes, :cost, :integer, :default => 0
  end
  
  def self.down
    remove_column :recipes, :cost
  end
end
