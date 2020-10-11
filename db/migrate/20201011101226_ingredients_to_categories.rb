class IngredientsToCategories < ActiveRecord::Migration[6.0]
  def up
    Ingredient.roots.each do |ingredient|
      create(ingredient: ingredient)
    end
  end

  def down
  end

  private

  def create(ingredient:, parent: nil)
    categorization = Categorization::COOKING_MAIN_INGREDIENT
    conditions = {name: ingredient.name, categorization_id: categorization.id}
    category = Category.where(conditions).first || Category.create(conditions.merge({author_id: ingredient.author_id, modifier_id: ingredient.modifier_id}))
    unless parent.nil?
      category.related_tree_categories << parent
    end
    ingredient.recipes.each do |recipe|
      recipe.categories << category
      recipe.save
    end

    if ingredient.has_children?
      ingredient.children.each do |child|
        create(ingredient: child, parent: category)
      end
    end
  end
end
