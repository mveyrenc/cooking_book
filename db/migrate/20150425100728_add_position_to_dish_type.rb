class AddPositionToDishType < ActiveRecord::Migration[6.0]
  def change
    add_column :dish_types, :position, :integer
  end
end
