class AddSlugToCategories < ActiveRecord::Migration[6.0]
  def change
    add_column :categories, :slug, :text
    add_index :categories, :name, :unique => true
    add_index :categories, :slug, :unique => true
  end
end
