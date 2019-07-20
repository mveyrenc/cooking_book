class AddWineToRecipes < ActiveRecord::Migration[6.0]
  def change
    add_column :recipes, :wine, :string
  end
end
