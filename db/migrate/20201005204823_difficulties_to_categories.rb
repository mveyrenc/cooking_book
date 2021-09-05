class DifficultiesToCategories < ActiveRecord::Migration[6.0]
  def up
    %w[very_easy easy intermediate experienced expert].each_with_index do |d, i|
      c = find_or_create_category(
          I18n.t("categorization.difficulty.#{d}"),
          Book::COOKING,
          Categorization::DIFFICULTY
      )
      Recipe.where(:difficulty => i + 1, :book => Book::COOKING).each do |r|
        r.categories << c
        r.save
      end
      c = find_or_create_category(
          I18n.t("categorization.difficulty.#{d}"),
          Book::HEALTH_WELLNESS,
          Categorization::DIFFICULTY
      )
      Recipe.where(:difficulty => i + 1, :book => Book::HEALTH_WELLNESS).each do |r|
        r.categories << c
        r.save
      end
      c = find_or_create_category(
          I18n.t("categorization.difficulty.#{d}"),
          Book::HOUSE,
          Categorization::DIFFICULTY
      )
      Recipe.where(:difficulty => i + 1, :book => Book::HOUSE).each do |r|
        r.categories << c
        r.save
      end
    end


  end

  def down
  end

  def find_or_create_category(name, book, categorization)
    conditions = {name: name, book: book, categorization: categorization}
    user = User.all.first

    Category.where(conditions).first || Category.create(conditions.merge({author_id: user.id, modifier_id: user.id}))
  end
end
