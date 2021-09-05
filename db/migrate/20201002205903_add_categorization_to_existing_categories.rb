class AddCategorizationToExistingCategories < ActiveRecord::Migration[6.0]
  def self.up
    Category.reset_column_information

    Category.update_all book: Book::COOKING, categorization: Categorization::DISH_TYPE

    Category.where('slug LIKE ?', "cuisine-%").update_all categorization: Categorization::REGION

    Category.where(:slug => 'longue-conservation').update_all categorization: Categorization::THEMATIC

    c = Category.find_by_slug('cuisine-occasionnelle')
    if c
      c.update categorization: Categorization::OCCASION
      c.related_by_categories.update_all categorization: Categorization::OCCASION
    end

    Category.where(:slug => 'pate-04d1675b-d689-4c07-ab27-28f56e1b43bd').update_all categorization: Categorization::MAIN_INGREDIENT

    Category.where(:slug => 'cru').update_all categorization: Categorization::COOKING_MODE
    Category.where(:slug => 'plancha').update_all categorization: Categorization::COOKING_MODE
    Category.where(:slug => 'barbecue').update_all categorization: Categorization::COOKING_MODE

    Category.where(:slug => 'a-trier').update_all categorization: Categorization::TODO
    Category.where(:slug => 'autre').update_all categorization: Categorization::TODO
    Category.where(:slug => 'fiche-pratique').update_all categorization: Categorization::TODO

    Category.where('slug LIKE ?', "savons%").update_all categorization: Categorization::PRODUCT_TYPE
    Category.where(:slug => 'saponification-a-froid').update_all categorization: Categorization::PRODUCT_TYPE

    Category.where(:slug => 'cosmetique').delete_all
    Category.where(:slug => 'produit-menager').delete_all

    Category.where(:is_course_type => true).update_all categorization: Categorization::SERVING
  end

  def self.down
  end
end
