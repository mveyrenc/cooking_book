class Application::FormField::SubmitComponent < Application::FormField::BaseComponent

  def initialize(
    form: nil,
    resource: nil,
    options: nil,
    html_options: nil,
    value: nil
  )
    super(
      form: form,
      method: nil,
      resource: resource,
      options: options,
      html_options: html_options
    )

    @value = value
  end

  def call
    form.submit value, html_options
  end

  private

  attr_reader :value

  def default_html_options
    merge_options(super, { class: 'button is-primary' })
  end

end