class AddIngredientsToRecipes < ActiveRecord::Migration
  def change
    create_table "ingredients_recipes", :force => true, :id => false do |t|
      t.integer "ingredient_id", :null => false
      t.integer "recipe_id", :null => false
    end
  end
end
