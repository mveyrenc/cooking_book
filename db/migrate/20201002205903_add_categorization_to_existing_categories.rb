class AddCategorizationToExistingCategories < ActiveRecord::Migration[6.0]
  def self.up
    Category.reset_column_information
    Category.update_all categorization_id: Categorization::COOKING_DISH_TYPE.id

    Category.where('slug LIKE ?', "cuisine-%").update_all categorization_id: Categorization::COOKING_REGION.id

    Category.where(:slug => 'longue-conservation').update_all categorization_id: Categorization::COOKING_THEMATIC.id

    c = Category.find_by_slug('cuisine-occasionnelle')
    c.update categorization_id: Categorization::COOKING_OCCASION.id
    c.related_by_categories.update_all categorization_id: Categorization::COOKING_OCCASION.id

    Category.where(:slug => 'pate-04d1675b-d689-4c07-ab27-28f56e1b43bd').update_all categorization_id: Categorization::COOKING_MAIN_INGREDIENT.id

    Category.where(:slug => 'cru').update_all categorization_id: Categorization::COOKING_COOKING_METHOD.id
    Category.where(:slug => 'plancha').update_all categorization_id: Categorization::COOKING_COOKING_METHOD.id
    Category.where(:slug => 'barbecue').update_all categorization_id: Categorization::COOKING_COOKING_METHOD.id

    Category.where(:slug => 'a-trier').update_all categorization_id: Categorization::COOKING_TODO.id
    Category.where(:slug => 'autre').update_all categorization_id: Categorization::COOKING_TODO.id
    Category.where(:slug => 'fiche-pratique').update_all categorization_id: Categorization::COOKING_TODO.id

    Category.where('slug LIKE ?', "savons%").update_all categorization_id: Categorization::HEALTHWELLNESS_PRODUCT_TYPE.id
    Category.where(:slug => 'saponification-a-froid').update_all categorization_id: Categorization::HEALTHWELLNESS_PRODUCT_TYPE.id

    Category.where(:slug => 'cosmetique').delete_all
    Category.where(:slug => 'produit-menager').delete_all

    Category.where(:is_course_type => true).update_all categorization_id: Categorization::COOKING_SERVING.id

    Category.reindex
    Recipe.reindex
  end

  def self.down
  end
end
