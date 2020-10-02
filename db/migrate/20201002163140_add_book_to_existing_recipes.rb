class AddBookToExistingRecipes < ActiveRecord::Migration[6.0]
  def self.up
    Recipe.reset_column_information
    Recipe.update_all book_id: Book::COOKING.id
    Recipe.joins(:categories).where('categories.slug' => 'cosmetique').update_all book_id: Book::HEALTH_WELLNESS.id
    Recipe.joins(:categories).where('categories.slug' => 'produit-menager').update_all book_id: Book::HOUSE.id
  end

  def self.down
  end
end
