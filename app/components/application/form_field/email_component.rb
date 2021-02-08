class Application::FormField::EmailComponent < Application::FormField::BaseComponent
  def default_html_options
    merge_options(super, { class: 'input' })
  end

  def call
    form.email_field method.to_sym, html_options
  end
end