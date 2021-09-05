class AddBookToExistingRecipes < ActiveRecord::Migration[6.0]
  def self.up
    Recipe.reset_column_information

    Recipe.update_all book: Book::COOKING
    Recipe.joins(:categories).where('categories.slug' => 'cosmetique').update_all book: Book::HEALTH_WELLNESS
    Recipe.joins(:categories).where('categories.slug' => 'produit-menager').update_all book: Book::HOUSE
  end

  def self.down
  end
end
