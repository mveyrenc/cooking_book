class Application::FormField::CollectionSelectComponent < Application::FormField::BaseComponent

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
    html_options: {}
  )
    super(
      form: form,
      method: method,
      resource: resource,
      options: options,
      html_options: html_options
    )
    @choices = choices
    @value_method = value_method
    @text_method = text_method
    @group_method = group_method
    @group_label_method = group_label_method
  end

  def default_html_options
    merge_options(super, {
      'data-controller': "application--form-field--collection-select"
    })
  end

  private

  attr_reader :choices
  attr_reader :value_method
  attr_reader :text_method
  attr_reader :group_method
  attr_reader :group_label_method

  def grouped?
    !group_method.nil? and !group_label_method.nil?
  end
end