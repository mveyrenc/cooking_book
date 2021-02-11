class AddMultipleToCategorization < ActiveRecord::Migration[6.1]
  def self.up
    add_column :categorizations, :multiple, :boolean, :default => true

    Categorization.where(name: Categorization::COOKING_COST.name).update_all(multiple: false)
    Categorization.where(name: Categorization::COOKING_DIFFICULTY.name).update_all(multiple: false)
  end

  def self.down
    remove_column :categorizations, :multiple
  end
end
