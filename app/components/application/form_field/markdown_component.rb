class Application::FormField::MarkdownComponent < Application::FormField::BaseComponent
  def default_html_options
    merge_options(super, {
      class: 'markdown-editor',
      rows: 2,
      'data-controller': "application--form-field--markdown"
    })
  end

  def call
    form.text_area method.to_sym, html_options
  end
end