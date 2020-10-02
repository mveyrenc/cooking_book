class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books do |t|
      t.string :name
      t.string :slug

      t.timestamps
    end
    add_index :books, :slug, unique: true
    add_reference :recipes, :book, foreign_key: true
  end
end
