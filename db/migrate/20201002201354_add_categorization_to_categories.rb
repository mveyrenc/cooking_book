class AddCategorizationToCategories < ActiveRecord::Migration[6.0]
  def change
    add_column :categories, :book, :string
    add_column :categories, :categorization, :string

    add_index :categories, :book
    add_index :categories, :categorization
  end
end
