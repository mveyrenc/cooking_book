class AddPictureToRecipes < ActiveRecord::Migration[6.0]
  def self.up
    add_attachment :recipes, :picture
  end

  def self.down
    remove_attachment :recipes, :picture
  end
end
