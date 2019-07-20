class AddMonthToIngredients < ActiveRecord::Migration[6.0]
  def change
    add_column :ingredients, :best_months, :text, array: true, default: []
    add_column :ingredients, :worse_months, :text, array: true, default: []
  end
end
