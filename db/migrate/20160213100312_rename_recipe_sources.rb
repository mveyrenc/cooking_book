class RenameRecipeSources < ActiveRecord::Migration
  def change
    create_join_table :recipes, :sources
  end
end