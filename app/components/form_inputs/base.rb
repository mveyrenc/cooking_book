module FormInputs
  module Base
    def initialize_input(form:, method:, resource: nil, is_required: false, is_disabled: false, options: {}, has_label: true, label_text: nil, label_options: {})
      @form = form
      @method = method
      @resource = resource
      @is_required = is_required
      @is_disabled = is_disabled
      @options = options

      @has_label = has_label
      @label_text = label_text
      @label_options = label_options
    end

    private

    attr_reader :form
    attr_reader :method

    attr_reader :resource
    attr_reader :is_required
    attr_reader :is_disabled
    attr_reader :options

    attr_reader :has_label
    attr_reader :label_text
    attr_reader :label_options
  end
end