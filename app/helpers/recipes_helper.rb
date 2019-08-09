module RecipesHelper
  def difficulty_rating recipe, size = 'normal'
    unless recipe.difficulty === 0
          size_class = size == 'normal' ? " fa-2x" : " fa-1x";
      content_tag :div, :class => "tags has-addons" do
        (1..recipe.difficulty).each do |i|
          concat content_tag :i, '', {
              :class => "tag fa fa-graduation-cap has-text-black-ter" + size_class,
              :title => I18n.t(Recipe.difficulty_types.invert[i], scope: 'recipes')
          }
        end
        (recipe.difficulty + 1..5).each do |i|
          concat content_tag :i, '', {
              :class => "tag fa fa-graduation-cap has-text-grey-lighter" + size_class,
              :title => I18n.t(Recipe.difficulty_types.invert[i], scope: 'recipes')
          }
        end
      end
    end
  end

  def cost_rating recipe, size = 'normal'
    unless recipe.cost === 0
      size_class = size == 'normal' ? " fa-2x" : " fa-1x";
      content_tag :div, :class => "tags has-addons" do
        (1..recipe.cost).each do |i|
          concat content_tag :i, '', {
              :class => "tag fa fa-euro-sign has-text-black-ter" + size_class,
              :title => I18n.t(Recipe.difficulty_types.invert[i], scope: 'recipes')
          }
        end
        (recipe.cost + 1..5).each do |i|
          concat content_tag :i, '', {
              :class => "tag fa fa-euro-sign has-text-grey-lighter" + size_class,
              :title => I18n.t(Recipe.difficulty_types.invert[i], scope: 'recipes')
          }
        end
      end
    end
  end
end
