class RemoveSourceFromRecipe < ActiveRecord::Migration
  def change
    remove_column :recipes, :source
  end
end
