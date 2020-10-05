class RemoveRecipeDifficulty < ActiveRecord::Migration[6.0]
  def change
    remove_column :recipes, :difficulty
  end
end
