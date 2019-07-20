class CreateSources < ActiveRecord::Migration[6.0]
  def change
    create_table :sources do |t|
      t.string :name
      t.string :slug
      t.string :ancestry

      t.timestamps
    end
    add_index :sources, :slug, unique: true
    add_index :sources, :ancestry
  end
end