class RemoveSourceFromRecipe < ActiveRecord::Migration[6.0]
  def change
    remove_column :recipes, :source
  end
end
