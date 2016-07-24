class AddCostToRecipes < ActiveRecord::Migration
  def self.up
    add_column :recipes, :cost, :integer, :default => 0
    
    Recipe.reset_column_information
    Recipe.all.each do |r|
      rates = r.rates 'cost'
      if rates.any?
        r.difficulty = rates.first.stars.to_i
        r.save
      end
    end
  end
  
  def self.down
    remove_column :recipes, :cost
  end
end
