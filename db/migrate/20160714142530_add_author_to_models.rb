class AddAuthorToModels < ActiveRecord::Migration[6.0]
  def change
    add_reference :recipes, :author, references: :users
    add_reference :recipes, :modifier, references: :users
    add_reference :categories, :author, references: :users
    add_reference :categories, :modifier, references: :users
    add_reference :ingredients, :author, references: :users
    add_reference :ingredients, :modifier, references: :users
    add_reference :sources, :author, references: :users
    add_reference :sources, :modifier, references: :users
  end
end
