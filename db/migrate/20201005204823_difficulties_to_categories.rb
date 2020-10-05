class DifficultiesToCategories < ActiveRecord::Migration[6.0]
  def up
    %w[very_easy easy intermediate experienced expert].each_with_index do |d, i|
      c = find_or_create_category(
          name: I18n.t("categorization.difficulty.#{d}"),
          categorization: Categorization::COOKING_DIFFICULTY
      )
      Recipe.where(:difficulty => i + 1, :book_id => c.categorization.book).each do |r|
        r.categories << c
        r.save
      end
      c = find_or_create_category(
          name: I18n.t("categorization.difficulty.#{d}"),
          categorization: Categorization::HEALTHWELLNESS_DIFFICULTY
      )
      Recipe.where(:difficulty => i + 1, :book_id => c.categorization.book).each do |r|
        r.categories << c
        r.save
      end
      c = find_or_create_category(
          name: I18n.t("categorization.difficulty.#{d}"),
          categorization: Categorization::HOUSE_DIFFICULTY
      )
      Recipe.where(:difficulty => i + 1, :book_id => c.categorization.book).each do |r|
        r.categories << c
        r.save
      end
    end


  end

  def down
  end

  def find_or_create_category(name:, categorization:)
    conditions = {name: name, categorization_id: categorization.id}
    user = User.all.first

    Category.where(conditions).first || Category.create(conditions.merge({author_id: user.id, modifier_id: user.id}))
  end
end
