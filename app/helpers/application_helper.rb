module ApplicationHelper
  
  def dish_type_label item
    content_tag :span, item, { :class => "label label-danger" }
  end
  
  def category_label item
    content_tag :span, item, { :class => "label label-primary" }
  end
  
  def additional_category_label item
    content_tag :span, item, { :class => "label label-default" }
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
end
