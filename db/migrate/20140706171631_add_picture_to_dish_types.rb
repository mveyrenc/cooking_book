class AddPictureToDishTypes < ActiveRecord::Migration
  def self.up
    add_attachment :dish_types, :picture
  end

  def self.down
    remove_attachment :dish_types, :picture
  end
end
