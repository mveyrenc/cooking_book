class MigrateDiffuciltyAndCostInRecipes < ActiveRecord::Migration
  def self.up
    Recipe.reset_column_information
    Recipe.all.each do |r|
      rates = r.rates 'difficulty'
      if rates.any?
        r.difficulty = rates.first.stars.to_i
        r.save
      end
      
      rates = r.rates 'cost'
      if rates.any?
        r.difficulty = rates.first.stars.to_i
        r.save
      end
    end
  end
  
  def self.down
  end
end
