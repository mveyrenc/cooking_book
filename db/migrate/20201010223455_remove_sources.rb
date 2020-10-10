class RemoveSources < ActiveRecord::Migration[6.0]
  def change
    drop_join_table :recipes, :sources
    drop_table :sources
  end
end
