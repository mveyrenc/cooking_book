class AddSlugToRecipes < ActiveRecord::Migration[6.0]
  def change
    add_column :recipes, :slug, :text
    add_index :recipes, :slug, :unique => true
  end
end
