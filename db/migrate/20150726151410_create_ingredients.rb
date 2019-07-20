class CreateIngredients < ActiveRecord::Migration[6.0]
  def change
    create_table :ingredients do |t|
      t.string :name
      t.string :slug
      t.string :ancestry

      t.timestamps
    end
    add_index :ingredients, :slug, unique: true
    add_index :ingredients, :ancestry
  end
end