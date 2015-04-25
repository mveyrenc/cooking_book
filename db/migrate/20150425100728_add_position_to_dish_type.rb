class AddPositionToDishType < ActiveRecord::Migration
  def change
    add_column :dish_types, :position, :integer
  end
end
