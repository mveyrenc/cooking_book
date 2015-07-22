class AddRelatedCategoriesToCategories < ActiveRecord::Migration
  def change
    create_table "categories_related", :force => true, :id => false do |t|
      t.integer "category_id", :null => false
      t.integer "related_category_id", :null => false
    end
    create_table "categories_suggested", :force => true, :id => false do |t|
      t.integer "category_id", :null => false
      t.integer "suggested_category_id", :null => false
    end
  end
end
