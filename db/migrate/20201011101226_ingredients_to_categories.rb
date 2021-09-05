class IngredientsToCategories < ActiveRecord::Migration[6.0]
  def up
    ActiveRecord::Base.connection.select_all("SELECT * FROM ingredients WHERE ancestry IS null").each do |ingredient|
      create(ingredient, nil)
    end
  end

  def down
  end

  private

  def create(ingredient, parent)
    book = Book::COOKING
    categorization = Categorization::MAIN_INGREDIENT
    conditions = { name: ingredient['name'], book: book, categorization: categorization }
    category = Category.where(conditions).first || Category.create(conditions.merge({ author_id: ingredient['author_id'], modifier_id: ingredient['modifier_id'] }))
    unless parent.nil?
      category.related_tree_categories << parent
    end

    ActiveRecord::Base.connection.select_all("SELECT * FROM ingredients_recipes WHERE ingredient_id = #{ingredient['id']}").each do |recipe|
      r = Recipe.find(recipe['recipe_id'])
      r.categories << category
      r.save
    end

    ancestry = "#{ingredient['ancestry']}/#{ingredient['id']}"
    ancestry.strip!
    ActiveRecord::Base.connection.select_all("SELECT * FROM ingredients WHERE ancestry = '#{ancestry}'").each do |child|
      create(child, category)
    end
  end
end
