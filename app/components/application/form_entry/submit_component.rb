class Application::FormEntry::SubmitComponent < Application::FormEntry::BaseComponent

  def initialize(
    form:,
    resource: nil,
    options: nil,
    field_html_options: nil,
    label_html_options: nil,
    value: nil
  )
    super(
      form: form,
      method: nil,
      resource: resource,
      options: options,
      field_html_options: field_html_options,
      label_html_options: label_html_options,
    )

    @value = value
  end

  def call
    render(Application::FormField::SubmitComponent.new(
      form: form,
      value: value,
      resource: resource,
      options: options,
      html_options: field_html_options
    ))
  end

  private

  attr_reader :value

end