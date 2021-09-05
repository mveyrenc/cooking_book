class AddBookToRecipes < ActiveRecord::Migration[6.0]
  def change
    add_column :recipes, :book, :string
    add_index :recipes, :book
  end
end
