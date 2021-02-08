class Application::FormEntry::CollectionSelectComponent < Application::FormEntry::BaseComponent

  def initialize(
    form:,
    method:,
    choices:,
    value_method:,
    text_method:,
    group_method: nil,
    group_label_method: nil,
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
    @group_method = group_method
    @group_label_method = group_label_method
  end

  private

  attr_reader :choices
  attr_reader :value_method
  attr_reader :text_method
  attr_reader :group_method
  attr_reader :group_label_method
end
