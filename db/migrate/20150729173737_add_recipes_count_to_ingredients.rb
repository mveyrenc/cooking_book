class AddRecipesCountToIngredients < ActiveRecord::Migration
  def self.up
    add_column :ingredients, :recipes_count, :integer, :default => 0
    
    Ingredient.reset_column_information
    Ingredient.all.each do |p|
      Ingredient.update_counters p.id, :recipes_count => p.recipes.length
    end
  end
  
  def self.down
    remove_column :ingredients, :recipes_count
  end
end
