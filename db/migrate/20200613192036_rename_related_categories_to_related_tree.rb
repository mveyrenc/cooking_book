class RenameRelatedCategoriesToRelatedTree < ActiveRecord::Migration[6.0]
  def change
    rename_table :categories_related, :categories_related_tree

    create_table "categories_related", :force => true, :id => false do |t|
      t.integer "category_id", :null => false
      t.integer "related_category_id", :null => false
    end
  end
end
