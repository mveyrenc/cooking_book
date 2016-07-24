module RecipesHelper
  def difficulty_rating recipe, size = 'normal'
    size_class = size == 'normal' ? " fa-2x" : " fa-1x";
    content_tag :div, :class => "difficulty-rating" do
      (1..recipe.difficulty).each do |i|
        concat content_tag :i, '', {
          :class => "fa fa-graduation-cap text-highlight"+size_class, 
          :title => I18n.t(Recipe.difficulty_types.invert[i], scope: 'recipes')
        }
      end
      (recipe.difficulty+1..5).each do |i|
        concat content_tag :i, '', {
          :class => "fa fa-graduation-cap text-disabled"+size_class,
          :title => I18n.t(Recipe.difficulty_types.invert[i], scope: 'recipes')
        }
      end
    end
  end
  
  def cost_rating recipe, size = 'normal'
    size_class = size == 'normal' ? " fa-2x" : " fa-1x";
    content_tag :div, :class => "cost-rating" do
      (1..recipe.cost).each do |i|
        concat content_tag :i, '', {
          :class => "fa fa-eur text-highlight"+size_class, 
          :title => I18n.t(Recipe.difficulty_types.invert[i], scope: 'recipes')
        }
      end
      (recipe.cost+1..5).each do |i|
        concat content_tag :i, '', {
          :class => "fa fa-eur text-disabled"+size_class, 
          :title => I18n.t(Recipe.difficulty_types.invert[i], scope: 'recipes')
        }  
      end
    end
  end
end
