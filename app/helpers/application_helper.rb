module ApplicationHelper
  
  def category_label item
    if item.is_course_type
      content_tag :span, item, { :class => "label label-success" }
    else
      content_tag :span, item, { :class => "label label-primary" }
    end
  end
  
  def additional_category_label item
    content_tag :span, item, { :class => "label label-default no-print" }
  end
  
  def main_ingredient_label item
    content_tag :span, item, { :class => "label label-primary no-print" }
  end
  
  def additional_main_ingredient_label item
    content_tag :span, item, { :class => "label label-default no-print" }
  end
  
  def back_button url
    link_to url, :class => 'btn btn-xs btn-default no-print', :title => I18n.t( 'application.back' ) do
      content_tag( :span, "", { :class => "glyphicon glyphicon-list-alt"} ) + " " + I18n.t( 'application.back' )
    end
  end
  
  def new_button url, name = I18n.t( 'application.new' )
    link_to url, :class => 'btn btn-xs btn-success no-print', :title => name do
      content_tag( :span, "", { :class => "glyphicon glyphicon-plus"} ) + " " + name
    end
  end
  
  def show_button url
    link_to url, :class => 'btn btn-xs btn-default no-print', :title => I18n.t( 'application.show' ) do
      content_tag( :span, "", { :class => "glyphicon glyphicon-info-sign"} ) + " " + I18n.t( 'application.show' )
    end
  end
  
  def edit_button url
    link_to url, :class => 'btn btn-xs btn-primary no-print', :title => I18n.t( 'application.edit' ) do
      content_tag( :span, "", { :class => "glyphicon glyphicon-pencil"} ) + " " + I18n.t( 'application.edit' )
    end
  end
  
  def move_lower_button url
    link_to url, :class => 'btn btn-xs btn-default no-print', :title => I18n.t( 'application.move_lower' ) do
      content_tag( :span, "", { :class => "glyphicon glyphicon-arrow-down"} )# + " " + I18n.t( 'application.move_lower' )
    end
  end
  
  def move_higher_button url
    link_to url, :class => 'btn btn-xs btn-default no-print', :title => I18n.t( 'application.move_higher' ) do
      content_tag( :span, "", { :class => "glyphicon glyphicon-arrow-up"} )# + " " + I18n.t( 'application.move_higher' )
    end
  end
  
  def destroy_button url
    link_to url, :class => 'btn btn-xs btn-danger no-print', :title => I18n.t( 'application.destroy' ), :method => :delete, :data => { confirm: I18n.t( 'application.destroy_confirmation' ) } do
      content_tag( :span, "", { :class => "glyphicon glyphicon-trash"} ) + " " + I18n.t( 'application.destroy' )
    end
  end
  
  def recipe_course_type_filter params, facet
    if facet
      content_tag :ul, :class => "list-unstyled" do
        facet.rows.collect do |facet_item| 
          if facet_item.instance and ( !params[:course_type_ids].present? or !params[:course_type_ids].include? facet_item.value )
            concat( link_to_filter params, :course_type_ids, facet_item )
          end
        end
      end
    end
  end
  
  def remove_recipe_course_type_include_filter params
    if params[:course_type_ids].present?
      params.except( :page )
      content_tag :div, :class => "active-filters" do
        params[:course_type_ids].each do |filter|
          filter_params = params.dup
          if filter_params[:course_type_ids].present? and filter_params[:course_type_ids].kind_of?(Array)
            filter_params[:course_type_ids].delete(filter)
          end
          filter_params.reject!{ |k,v| v.empty? }
          concat( link_to_remove_include_filter filter_params,  Category.find( filter )  )
        end 
      end
    end
  end
  
  def remove_recipe_course_type_exclude_filter params
    if params[:exclu_course_type_ids].present?
      params.except( :page )
      content_tag :div, :class => "active-filters" do
        params[:exclu_course_type_ids].each do |filter|
          filter_params = params.dup
          if filter_params[:exclu_course_type_ids].present? and filter_params[:exclu_course_type_ids].kind_of?(Array)
            filter_params[:exclu_course_type_ids].delete(filter)
          end
          filter_params.reject!{ |k,v| v.empty? }
          concat( link_to_remove_exclude_filter filter_params,  Category.find( filter ) )
        end 
      end
    end
  end
  
  def recipe_category_filter params, facet
    if facet
      content_tag :ul, :class => "list-unstyled" do
        facet.rows.collect do |facet_item| 
          if facet_item.instance and ( !params[:category_ids].present? or !params[:category_ids].include? facet_item.value )
            concat( link_to_filter params, :category_ids, facet_item )
          end
        end
      end
    end
  end
  
  def remove_recipe_category_include_filter params
    if params[:category_ids].present?
      params.except( :page )
      content_tag :div, :class => "active-filters" do
        params[:category_ids].each do |filter|
          filter_params = params.dup
          if filter_params[:category_ids].present? and filter_params[:category_ids].kind_of?(Array)
            filter_params[:category_ids].delete(filter)
          end
          filter_params.reject!{ |k,v| v.empty? }
          concat( link_to_remove_include_filter filter_params,  Category.find( filter )  )
        end 
      end
    end
  end
  
  def remove_recipe_category_exclude_filter params
    if params[:exclu_category_ids].present?
      params.except( :page )
      content_tag :div, :class => "active-filters" do
        params[:exclu_category_ids].each do |filter|
          filter_params = params.dup
          if filter_params[:exclu_category_ids].present? and filter_params[:exclu_category_ids].kind_of?(Array)
            filter_params[:exclu_category_ids].delete(filter)
          end
          filter_params.reject!{ |k,v| v.empty? }
          concat( link_to_remove_exclude_filter filter_params,  Category.find( filter ) )
        end 
      end
    end
  end
  
  def recipe_main_ingredient_filter params, facet
    if facet
      content_tag :ul, :class => "list-unstyled" do
        facet.rows.collect do |facet_item| 
          if facet_item.instance and ( !params[:main_ingredient_ids].present? or !params[:main_ingredient_ids].include? facet_item.value )
            concat( link_to_filter params, :main_ingredient_ids, facet_item )
          end
        end
      end
    end
  end
  
  def remove_recipe_main_ingredient_include_filter params
    if params[:main_ingredient_ids].present?
      params.except( :page )
      content_tag :div, :class => "active-filters" do
        params[:main_ingredient_ids].each do |filter|
          filter_params = params.dup
          if filter_params[:main_ingredient_ids].present? and filter_params[:main_ingredient_ids].kind_of?(Array)
            filter_params[:main_ingredient_ids].delete(filter)
          end
          filter_params.reject!{ |k,v| v.empty? }
          concat( link_to_remove_include_filter filter_params,  Ingredient.find( filter )  )
        end 
      end
    end
  end
  
  def remove_recipe_main_ingredient_exclude_filter params
    if params[:exclu_main_ingredient_ids].present?
      params.except( :page )
      content_tag :div, :class => "active-filters" do
        params[:exclu_main_ingredient_ids].each do |filter|
          filter_params = params.dup
          if filter_params[:exclu_main_ingredient_ids].present? and filter_params[:exclu_main_ingredient_ids].kind_of?(Array)
            filter_params[:exclu_main_ingredient_ids].delete(filter)
          end
          filter_params.reject!{ |k,v| v.empty? }
          concat( link_to_remove_exclude_filter filter_params,  Ingredient.find( filter )  )
        end 
      end
    end
  end
  
  def recipe_sources_filter params, facet
    if facet
      content_tag :ul, :class => "list-unstyled" do
        facet.rows.collect do |facet_item| 
          if !params[:source_ids].present? or !params[:source_ids].include? facet_item.value 
            concat( link_to_filter params, :source_ids, facet_item )
          end
        end
      end
    end
  end
  
  def remove_recipe_sources_include_filter params
    if params[:source_ids].present?
      params.except( :page )
      content_tag :div, :class => "active-filters" do
        params[:source_ids].each do |filter|
          filter_params = params.dup.except( :page )
          if filter_params[:source_ids].present? and filter_params[:source_ids].kind_of?(Array)
            filter_params[:source_ids].delete(filter)
          end
          filter_params.reject!{ |k,v| v.empty? }
          concat( link_to_remove_include_filter( filter_params, Source.find( filter ) ))
        end 
      end
    end
  end
  
  def remove_recipe_sources_exclude_filter params
    if params[:exclu_source_ids].present?
      params.except( :page )
      content_tag :div, :class => "active-filters" do
        params[:exclu_source_ids].each do |filter|
          filter_params = params.dup.except( :page )
          if filter_params[:exclu_source_ids].present? and filter_params[:exclu_source_ids].kind_of?(Array)
            filter_params[:exclu_source_ids].delete(filter)
          end
          filter_params.reject!{ |k,v| v.empty? }
          concat( link_to_remove_exclude_filter( filter_params, Source.find( filter ) ))
        end 
      end
    end
  end
  
  def link_to_filter params, param_identifier, item
    name = item.instance ? item.instance.name : item.value
    include_param_identifier = param_identifier.to_s
    exclude_param_identifier = "exclu_"+param_identifier.to_s
    content_tag :li do
      filter_params = params.dup.except( :page )
      if filter_params[include_param_identifier].present? and filter_params[include_param_identifier].kind_of?(Array)
        filter_params[include_param_identifier] << item.value
      else
        filter_params[include_param_identifier] = [item.value]
      end
      concat link_to_add_include_filter filter_params
      filter_params = params.dup.except( :page )
      if filter_params[exclude_param_identifier].present? and filter_params[exclude_param_identifier].kind_of?(Array)
        filter_params[exclude_param_identifier] << item.value.to_s
      else
        filter_params[exclude_param_identifier] = [item.value.to_s]
      end
      concat link_to_add_exclude_filter filter_params
      concat name
      concat content_tag( :span, item.count, { :class => "badge pull-right"} )
    end
  end
  
  def link_to_add_include_filter filter_params
    link_to( recipes_path( filter_params ), {:class => 'btn btn-success btn-xs' } ) do
      content_tag( :span, "", { :class => "glyphicon glyphicon-plus"} )
    end
  end
  
  def link_to_add_exclude_filter filter_params
    link_to( recipes_path( filter_params ), {:class => 'btn btn-danger btn-xs' } ) do
      content_tag( :span, "", { :class => "glyphicon glyphicon-remove"} )
    end
  end
  
  def link_to_remove_include_filter params, filter
    link_to( recipes_path( params ), {:class => 'btn btn-success btn-xs' } ) do
      content_tag( :span, "", { :class => "glyphicon glyphicon-remove"} ) + " " + filter
    end
  end
  
  def link_to_remove_exclude_filter params, filter
    link_to( recipes_path( params ), {:class => 'btn btn-danger btn-xs' } ) do
      content_tag( :span, "", { :class => "glyphicon glyphicon-remove"} ) + " " + filter
    end
  end

end
