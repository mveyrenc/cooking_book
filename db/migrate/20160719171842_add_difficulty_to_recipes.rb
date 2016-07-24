class AddDifficultyToRecipes < ActiveRecord::Migration
  def self.up
    add_column :recipes, :difficulty, :integer, :default => 0
  end
  
  def self.down
    remove_column :recipes, :difficulty
  end
end
