module FormFields
  module Base
    def initialize_fields(form:, method:, resource: nil, is_required: false, is_disabled: false, options: {})
      @form = form
      @method = method
      @resource = resource
      @is_required = is_required
      @is_disabled = is_disabled
      @options = options
    end

    private

    attr_reader :form
    attr_reader :method

    attr_reader :resource
    attr_reader :is_required
    attr_reader :is_disabled
    attr_reader :options

    def input_options
      default_options = {class: "input"}
      merge_options(default_options, @options)
    end

    def merge_options(defaults, new_options)
      (defaults.keys + new_options.keys).inject({}) {|h, key|
        h[key] = [defaults[key], new_options[key]].compact.join(" ")
        h
      }
    end
  end
end