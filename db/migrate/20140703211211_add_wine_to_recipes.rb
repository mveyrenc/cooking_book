class AddWineToRecipes < ActiveRecord::Migration
  def change
    add_column :recipes, :wine, :string
  end
end
