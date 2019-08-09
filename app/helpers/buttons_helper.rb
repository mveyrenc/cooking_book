module ButtonsHelper


  def back_button url
    link_to url, :class => 'button is-blue no-print', :title => I18n.t('application.back') do
      font_awesome_icon("list-alt") + content_tag(:span, I18n.t('application.back'))
    end
  end

  def new_button url, name = I18n.t('application.new')
    link_to url, :class => 'button is-green no-print', :title => name do
      font_awesome_icon("plus") + content_tag(:span, name)
    end
  end

  def show_button url
    link_to url, :class => 'button is-blue no-print', :title => I18n.t('application.show') do
      font_awesome_icon("info-sign") + content_tag(:span, I18n.t('application.show'))
    end
  end

  def edit_button url
    link_to url, :class => 'button is-cyan no-print', :title => I18n.t('application.edit') do
      font_awesome_icon("edit") + content_tag(:span, I18n.t('application.edit'))
    end
  end

  def move_lower_button url
    link_to url, :class => 'button is-blue no-print', :title => I18n.t('application.move_lower') do
      font_awesome_icon("arrow-down")
    end
  end

  def move_higher_button url
    link_to url, :class => 'button is-blue no-print', :title => I18n.t('application.move_higher') do
      font_awesome_icon("arrow-up")
    end
  end

  def destroy_button url
    link_to url, :class => 'button is-red no-print', :title => I18n.t('application.destroy'), :method => :delete, :data => {confirm: I18n.t('application.destroy_confirmation')} do
      font_awesome_icon("trash") + content_tag(:span, I18n.t('application.destroy'))
    end
  end
end
