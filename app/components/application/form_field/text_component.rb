class Application::FormField::TextComponent < Application::FormField::BaseComponent
  def default_html_options
    merge_options(super, { class: 'input' })
  end

  def call
    form.text_field method.to_sym, html_options
  end
end