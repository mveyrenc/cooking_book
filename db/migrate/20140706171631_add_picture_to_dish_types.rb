class AddPictureToDishTypes < ActiveRecord::Migration[6.0]
  def self.up
    add_attachment :dish_types, :picture
  end

  def self.down
    remove_attachment :dish_types, :picture
  end
end
