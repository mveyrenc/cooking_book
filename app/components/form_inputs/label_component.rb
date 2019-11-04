module FormInputs
  class LabelComponent < ActionView::Component::Base
    include FormInputs::Base

    validates :form, :method, presence: true

    def initialize(form:, method:, resource: nil, text: nil, is_required: false, is_disabled: false, options: {})
      @text = text
      initialize_input(form: form, method: method, resource: resource, is_required: is_required, is_disabled: is_disabled, options: options)
    end

    private

    attr_reader :text

    def has_label
      text.nil? || !text.blank?
    end
  end
end