class Application::FormField::CollectionCheckboxesComponent < Application::FormField::BaseComponent

  def initialize(
    form:,
    method:,
    choices:,
    value_method:,
    text_method:,
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
  end

  def call
    # form.collection_check_boxes method.to_sym, choices, value_method, text_method, options, html_options
    content_tag :div, class: "columns is-multiline" do
      form.collection_check_boxes method.to_sym, choices, value_method, text_method, options, html_options do |b|
        content_tag :div, class: "field column is-6" do
          b.check_box(class: "is-checkradio") + b.label
        end
        # b.label { b.check_box }
      end
    end
  end

  private

  attr_reader :choices
  attr_reader :value_method
  attr_reader :text_method

  def initialize_html_options(html_options)
    @html_options = merge_options(default_html_options, html_options)
    @html_options[:required] = false
  end

  def default_html_options
    merge_options(super, { class: 'is-checkradio' })
  end

end