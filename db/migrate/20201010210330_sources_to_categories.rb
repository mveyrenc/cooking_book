class SourcesToCategories < ActiveRecord::Migration[6.0]

  def up
    ActiveRecord::Base.connection.select_all("SELECT * FROM sources WHERE ancestry IS null").each do |source|
      create(source, nil)
    end
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end

  private

  def create(source, parent)
    if parent.nil?
      if %w[bon-appetit-bien-sur bonne-cuisine classeurs cuisine-az cuisine-d-ici elle-a-table fou-de-patisserie hachette-fait-maison larousse le-parfait livre-valrhona magazine maxi-cuisine meilleur-du-chef regal saveurs une-plume-dans-la-cuisine www-likeachef-fr www-likeachef-fr www-likeachef-fr].include? source['slug']
        book = Book::COOKING
        categorization = Categorization::SOURCE
      elsif ['aroma-zone',].include? source['slug']
        book = Book::HEALTH_WELLNESS
        categorization = Categorization::SOURCE
      elsif %w[revons-savons savons-fantaisies].include? source['slug']
        book = Book::HOUSE
        categorization = Categorization::SOURCE
      else
        book = Book::COOKING
        categorization = Categorization::CHEF
      end
    else
      book = parent.book
      categorization = parent.categorization
    end

    conditions = { name: source['name'], book: book, categorization: categorization }
    category = Category.where(conditions).first || Category.create(conditions.merge({ author_id: source['author_id'], modifier_id: source['modifier_id'] }))

    unless parent.nil?
      category.related_categories << parent
    end

    ActiveRecord::Base.connection.select_all("SELECT * FROM recipes_sources WHERE source_id = #{source['id']}").each do |recipe|
      r = Recipe.find(recipe['recipe_id'])
      r.categories << category
      r.save
    end

    ancestry = "#{source['ancestry']}/#{source['id']}"
    ancestry.strip!
    ActiveRecord::Base.connection.select_all("SELECT * FROM sources WHERE ancestry = '#{ancestry}'").each do |child|
      create(child, category)
    end
  end
end
