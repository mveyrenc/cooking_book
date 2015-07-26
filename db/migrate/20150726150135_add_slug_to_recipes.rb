class AddSlugToRecipes < ActiveRecord::Migration
  def change
    add_column :recipes, :slug, :text
    add_index :recipes, :slug, :unique => true
  end
end
