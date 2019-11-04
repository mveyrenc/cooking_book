module FormFields
  class LabelComponent < ActionView::Component::Base
    include FormFields::Base

    # validates :form, :method, presence: true

    def initialize(form:, method:, resource: nil, text: nil, is_required: false, is_disabled: false, options: {})
      @text = text
      initialize_fields(form: form, method: method, resource: resource, is_required: is_required, is_disabled: is_disabled, options: options)
    end

    private

    attr_reader :text

    def options
      default_options = {class: "label"}
      default_options[:class] = default_options[:class] + " is-required" if is_required
      merge_options(default_options, @options)
    end

  end
end