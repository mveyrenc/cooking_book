class SourcesToCategories < ActiveRecord::Migration[6.0]

  def up
    Source.roots.each do |source|
      create(source: source)
    end
  end

  def down
  end

  private

  def create(source:, parent: nil)
    if parent.nil?
      if %w[bon-appetit-bien-sur bonne-cuisine classeurs cuisine-az cuisine-d-ici elle-a-table fou-de-patisserie hachette-fait-maison larousse le-parfait livre-valrhona magazine maxi-cuisine meilleur-du-chef regal saveurs une-plume-dans-la-cuisine www-likeachef-fr www-likeachef-fr www-likeachef-fr].include? source.slug
        categorization = Categorization::COOKING_SOURCE
      elsif ['aroma-zone',].include? source.slug
        categorization = Categorization::HEALTHWELLNESS_SOURCE
      elsif %w[revons-savons savons-fantaisies].include? source.slug
        categorization = Categorization::HOUSE_SOURCE
      else
        categorization = Categorization::COOKING_CHEF
      end
    else
      categorization = parent.categorization
    end
    conditions = {name: source.name, categorization_id: categorization.id}
    category = Category.where(conditions).first || Category.create(conditions.merge({author_id: source.author_id, modifier_id: source.modifier_id}))
    unless parent.nil?
      category.related_categories << parent
    end
    source.recipes.each do |recipe|
      recipe.categories << category
      recipe.save
    end

    if source.has_children?
      source.children.each do |child|
        create(source: child, parent: category)
      end
    end
  end
end
