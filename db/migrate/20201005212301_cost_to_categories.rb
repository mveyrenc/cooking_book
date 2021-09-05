class CostToCategories < ActiveRecord::Migration[6.0]

  def up
    %w[cheap affordable middle pretty_expensive expensive].each_with_index do |d, i|
      c = find_or_create_category(
        I18n.t("categorization.cost.#{d}"),
        Book::COOKING,
        Categorization::COST
      )
      Recipe.where(:cost => i + 1, :book => c.book).each do |r|
        r.categories << c
        r.save
      end
      c = find_or_create_category(
        I18n.t("categorization.cost.#{d}"),
        Book::HEALTH_WELLNESS,
        Categorization::COST
      )
      Recipe.where(:cost => i + 1, :book => c.book).each do |r|
        r.categories << c
        r.save
      end
      c = find_or_create_category(
        I18n.t("categorization.cost.#{d}"),
        Book::HOUSE,
        Categorization::COST
      )
      Recipe.where(:cost => i + 1, :book => c.book).each do |r|
        r.categories << c
        r.save
      end
    end

  end

  def down
  end

  def find_or_create_category(name, book, categorization)
    conditions = { name: name, book: book, categorization: categorization }
    user = User.all.first

    Category.where(conditions).first || Category.create(conditions.merge({ author_id: user.id, modifier_id: user.id }))
  end
end
