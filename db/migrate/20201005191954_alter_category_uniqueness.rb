class AlterCategoryUniqueness < ActiveRecord::Migration[6.0]
  def change
    remove_index :categories, :name
    add_index :categories, [:name, :categorization_id], unique: true
  end
end
