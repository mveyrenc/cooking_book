class Application::FormField::TextareaComponent < Application::FormField::BaseComponent
  def call
    form.text_area method.to_sym, html_options
  end

  def default_html_options
    merge_options(super, { class: 'textarea', rows: 2 })
  end
end