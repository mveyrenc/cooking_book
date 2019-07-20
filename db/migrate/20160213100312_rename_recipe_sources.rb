class RenameRecipeSources < ActiveRecord::Migration[6.0]
  def change
    create_join_table :recipes, :sources
  end
end