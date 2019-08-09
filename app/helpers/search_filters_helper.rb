module SearchFiltersHelper
  def recipe_course_type_filter params, facet
    if facet
      content_tag :ul, :class => "list-unstyled" do
        facet.rows.collect do |facet_item|
          if facet_item.instance and (!params[:course_type_ids].present? or !params[:course_type_ids].include? facet_item.value)
            concat(link_to_filter params, :course_type_ids, facet_item)
          end
        end
      end
    end
  end

  def remove_recipe_course_type_include_filter params
    if params[:course_type_ids].present?
      params.except(:page)
      content_tag :div, :class => "active-filters" do
        params[:course_type_ids].each do |filter|
          filter_params = params.dup
          if filter_params[:course_type_ids].present? and filter_params[:course_type_ids].kind_of?(Array)
            filter_params[:course_type_ids].delete(filter)
          end
          filter_params.reject! {|k, v| v.empty?}
          concat(link_to_remove_include_filter filter_params, Category.find(filter))
        end
      end
    end
  end

  def remove_recipe_course_type_exclude_filter params
    if params[:exclu_course_type_ids].present?
      params.except(:page)
      content_tag :div, :class => "active-filters" do
        params[:exclu_course_type_ids].each do |filter|
          filter_params = params.dup
          if filter_params[:exclu_course_type_ids].present? and filter_params[:exclu_course_type_ids].kind_of?(Array)
            filter_params[:exclu_course_type_ids].delete(filter)
          end
          filter_params.reject! {|k, v| v.empty?}
          concat(link_to_remove_exclude_filter filter_params, Category.find(filter))
        end
      end
    end
  end

  def recipe_difficulty_filter params, facet
    if facet
      content_tag :ul, :class => "list-unstyled" do
        facet.rows.collect do |facet_item|
          if facet_item and (!params[:difficulty].present? or !params[:difficulty].include? facet_item.value)
            concat(link_to_filter params, :difficulty, facet_item)
          end
        end
      end
    end
  end

  def remove_recipe_difficulty_include_filter params
    if params[:difficulty].present?
      params.except(:page)
      content_tag :div, :class => "active-filters" do
        params[:difficulty].each do |filter|
          filter_params = params.dup
          if filter_params[:difficulty].present? and filter_params[:difficulty].kind_of?(Array)
            filter_params[:difficulty].delete(filter)
          end
          filter_params.reject! {|k, v| v.empty?}
          concat(link_to_remove_include_filter filter_params, I18n.t(Recipe.difficulty_types.invert[filter], scope: 'recipes'))
        end
      end
    end
  end

  def remove_recipe_difficulty_exclude_filter params
    if params[:exclu_difficulty].present?
      params.except(:page)
      content_tag :div, :class => "active-filters" do
        params[:exclu_difficulty].each do |filter|
          filter_params = params.dup
          if filter_params[:exclu_difficulty].present? and filter_params[:exclu_difficulty].kind_of?(Array)
            filter_params[:exclu_difficulty].delete(filter)
          end
          filter_params.reject! {|k, v| v.empty?}
          concat(link_to_remove_exclude_filter filter_params, I18n.t(Recipe.difficulty_types.invert[filter], scope: 'recipes'))
        end
      end
    end
  end

  def recipe_cost_filter params, facet
    if facet
      content_tag :ul, :class => "list-unstyled" do
        facet.rows.collect do |facet_item|
          if facet_item and (!params[:cost].present? or !params[:cost].include? facet_item.value)
            concat(link_to_filter params, :cost, facet_item)
          end
        end
      end
    end
  end

  def remove_recipe_cost_include_filter params
    if params[:cost].present?
      params.except(:page)
      content_tag :div, :class => "active-filters" do
        params[:cost].each do |filter|
          filter_params = params.dup
          if filter_params[:cost].present? and filter_params[:cost].kind_of?(Array)
            filter_params[:cost].delete(filter)
          end
          filter_params.reject! {|k, v| v.empty?}
          concat(link_to_remove_include_filter filter_params, I18n.t(Recipe.difficulty_types.invert[filter], scope: 'recipes'))
        end
      end
    end
  end

  def remove_recipe_cost_exclude_filter params
    if params[:cost].present?
      params.except(:page)
      content_tag :div, :class => "active-filters" do
        params[:cost].each do |filter|
          filter_params = params.dup
          if filter_params[:cost].present? and filter_params[:cost].kind_of?(Array)
            filter_params[:cost].delete(filter)
          end
          filter_params.reject! {|k, v| v.empty?}
          concat(link_to_remove_exclude_filter filter_params, I18n.t(Recipe.difficulty_types.invert[filter], scope: 'recipes'))
        end
      end
    end
  end

  def recipe_category_filter params, facet
    if facet
      content_tag :ul, :class => "list-unstyled" do
        facet.rows.collect do |facet_item|
          if facet_item.instance and (!params[:category_ids].present? or !params[:category_ids].include? facet_item.value)
            concat(link_to_filter params, :category_ids, facet_item)
          end
        end
      end
    end
  end

  def remove_recipe_category_include_filter params
    if params[:category_ids].present?
      params.except(:page)
      content_tag :div, :class => "active-filters" do
        params[:category_ids].each do |filter|
          filter_params = params.dup
          if filter_params[:category_ids].present? and filter_params[:category_ids].kind_of?(Array)
            filter_params[:category_ids].delete(filter)
          end
          filter_params.reject! {|k, v| v.empty?}
          concat(link_to_remove_include_filter filter_params, Category.find(filter))
        end
      end
    end
  end

  def remove_recipe_category_exclude_filter params
    if params[:exclu_category_ids].present?
      params.except(:page)
      content_tag :div, :class => "active-filters" do
        params[:exclu_category_ids].each do |filter|
          filter_params = params.dup
          if filter_params[:exclu_category_ids].present? and filter_params[:exclu_category_ids].kind_of?(Array)
            filter_params[:exclu_category_ids].delete(filter)
          end
          filter_params.reject! {|k, v| v.empty?}
          concat(link_to_remove_exclude_filter filter_params, Category.find(filter))
        end
      end
    end
  end

  def recipe_main_ingredient_filter params, facet
    if facet
      content_tag :ul, :class => "list-unstyled" do
        facet.rows.collect do |facet_item|
          if facet_item.instance and (!params[:main_ingredient_ids].present? or !params[:main_ingredient_ids].include? facet_item.value)
            concat(link_to_filter params, :main_ingredient_ids, facet_item)
          end
        end
      end
    end
  end

  def remove_recipe_main_ingredient_include_filter params
    if params[:main_ingredient_ids].present?
      params.except(:page)
      content_tag :div, :class => "active-filters" do
        params[:main_ingredient_ids].each do |filter|
          filter_params = params.dup
          if filter_params[:main_ingredient_ids].present? and filter_params[:main_ingredient_ids].kind_of?(Array)
            filter_params[:main_ingredient_ids].delete(filter)
          end
          filter_params.reject! {|k, v| v.empty?}
          concat(link_to_remove_include_filter filter_params, Ingredient.find(filter))
        end
      end
    end
  end

  def remove_recipe_main_ingredient_exclude_filter params
    if params[:exclu_main_ingredient_ids].present?
      params.except(:page)
      content_tag :div, :class => "active-filters" do
        params[:exclu_main_ingredient_ids].each do |filter|
          filter_params = params.dup
          if filter_params[:exclu_main_ingredient_ids].present? and filter_params[:exclu_main_ingredient_ids].kind_of?(Array)
            filter_params[:exclu_main_ingredient_ids].delete(filter)
          end
          filter_params.reject! {|k, v| v.empty?}
          concat(link_to_remove_exclude_filter filter_params, Ingredient.find(filter))
        end
      end
    end
  end

  def recipe_sources_filter params, facet
    if facet
      content_tag :ul, :class => "list-unstyled" do
        facet.rows.collect do |facet_item|
          if !params[:source_ids].present? or !params[:source_ids].include? facet_item.value
            concat(link_to_filter params, :source_ids, facet_item)
          end
        end
      end
    end
  end

  def remove_recipe_sources_include_filter params
    if params[:source_ids].present?
      params.except(:page)
      content_tag :div, :class => "active-filters" do
        params[:source_ids].each do |filter|
          filter_params = params.dup.except(:page)
          if filter_params[:source_ids].present? and filter_params[:source_ids].kind_of?(Array)
            filter_params[:source_ids].delete(filter)
          end
          filter_params.reject! {|k, v| v.empty?}
          concat(link_to_remove_include_filter(filter_params, Source.find(filter)))
        end
      end
    end
  end

  def remove_recipe_sources_exclude_filter params
    if params[:exclu_source_ids].present?
      params.except(:page)
      content_tag :div, :class => "active-filters" do
        params[:exclu_source_ids].each do |filter|
          filter_params = params.dup.except(:page)
          if filter_params[:exclu_source_ids].present? and filter_params[:exclu_source_ids].kind_of?(Array)
            filter_params[:exclu_source_ids].delete(filter)
          end
          filter_params.reject! {|k, v| v.empty?}
          concat(link_to_remove_exclude_filter(filter_params, Source.find(filter)))
        end
      end
    end
  end

  def link_to_filter params, param_identifier, item
    name = item.instance ? item.instance.name : I18n.t(Recipe.difficulty_types.invert[item.value], scope: 'recipes')
    include_param_identifier = param_identifier.to_s
    exclude_param_identifier = "exclu_" + param_identifier.to_s
    content_tag :li do
      filter_params = params.dup.except(:page)
      if filter_params[include_param_identifier].present? and filter_params[include_param_identifier].kind_of?(Array)
        filter_params[include_param_identifier] << item.value
      else
        filter_params[include_param_identifier] = [item.value]
      end
      concat link_to_add_include_filter filter_params
      filter_params = params.dup.except(:page)
      if filter_params[exclude_param_identifier].present? and filter_params[exclude_param_identifier].kind_of?(Array)
        filter_params[exclude_param_identifier] << item.value.to_s
      else
        filter_params[exclude_param_identifier] = [item.value.to_s]
      end
      concat link_to_add_exclude_filter filter_params
      concat name
      concat content_tag(:span, item.count, {:class => "badge pull-right"})
    end
  end

  def link_to_add_include_filter filter_params
    link_to(recipes_path(filter_params), {:class => 'btn is-green is-xs'}) do
      content_tag(:span, "", {:class => "fa fa-plus"})
    end
  end

  def link_to_add_exclude_filter filter_params
    link_to(recipes_path(filter_params), {:class => 'btn is-red is-xs'}) do
      content_tag(:span, "", {:class => "fa fa-remove"})
    end
  end

  def link_to_remove_include_filter params, filter
    link_to(recipes_path(params), {:class => 'btn is-green is-xs'}) do
      content_tag(:span, "", {:class => "fa fa-remove"}) + " " + filter
    end
  end

  def link_to_remove_exclude_filter params, filter
    link_to(recipes_path(params), {:class => 'btn is-red is-xs'}) do
      content_tag(:span, "", {:class => "fa fa-remove"}) + " " + filter
    end
  end
end