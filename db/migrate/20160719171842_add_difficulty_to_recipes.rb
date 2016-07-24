class AddDifficultyToRecipes < ActiveRecord::Migration
  def self.up
    add_column :recipes, :difficulty, :integer, :default => 0
    
    Recipe.reset_column_information
    Recipe.all.each do |r|
      rates = r.rates 'difficulty'
      if rates.any?
        r.difficulty = rates.first.stars.to_i
        r.save
      end
    end
  end
  
  def self.down
    remove_column :recipes, :difficulty
  end
end
