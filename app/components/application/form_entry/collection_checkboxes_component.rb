class Application::FormEntry::CollectionCheckboxesComponent < Application::FormEntry::BaseComponent

  def initialize(
    form:,
    method:,
    choices:,
    value_method:,
    text_method:,
    resource: nil,
    options: {},
    field_html_options: {},
    label_html_options: {}
  )
    super(
      form: form,
      method: method,
      resource: resource,
      options: options,
      field_html_options: field_html_options,
      label_html_options: label_html_options
    )
    @choices = choices
    @value_method = value_method
    @text_method = text_method
  end

  def call
    render(Application::FormEntry::EntryComponent.new(
      form: form,
      method: method.to_sym,
      resource: resource,
      options: options,
      label_html_options: label_html_options
    )) do
      render(Application::FormField::CollectionCheckboxesComponent.new(
        form: form,
        method: method.to_sym,
        resource: resource,
        choices: choices,
        value_method: value_method,
        text_method: text_method,
        options: options,
        html_options: field_html_options
      ))
    end
  end

  private

  attr_reader :choices
  attr_reader :value_method
  attr_reader :text_method
end