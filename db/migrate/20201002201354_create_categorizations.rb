class CreateCategorizations < ActiveRecord::Migration[6.0]
  def change
    create_table :categorizations do |t|
      t.string :name
      t.string :slug
      t.references :book, null: false, foreign_key: true

      t.timestamps
    end
    add_index :categorizations, [:slug, :book_id], unique: true
    add_reference :categories, :categorization, foreign_key: true
  end
end
