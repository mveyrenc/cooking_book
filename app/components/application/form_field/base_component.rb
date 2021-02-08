module Application::FormField
  class BaseComponent < ViewComponent::Base

    def initialize(
      form: nil,
      method:,
      resource: nil,
      options: {},
      html_options: {}
    )
      @form = form
      @method = method
      @resource = resource

      initialize_options(options)
      initialize_html_options(html_options)
    end

    protected

    attr_reader :form, :method, :resource
    attr_reader :options, :html_options

    def default_options
      {}
    end

    def initialize_options(options)
      @options = merge_options(default_options, options)
    end

    def default_html_options
      default_options = {}
      if is_required
        default_options[:required] = true
      end
      if is_disabled
        default_options[:disabled] = true
      end
      default_options
    end

    def initialize_html_options(html_options)
      @html_options = merge_options(default_html_options, html_options)
    end

    def is_required
      options.fetch(:required, false)
    end

    def is_disabled
      options.fetch(:disabled, false)
    end

    def merge_options(defaults, new_options)
      defaults = {} if defaults.nil?
      new_options = {} if new_options.nil?
      (defaults.keys + new_options.keys).inject({}) { |h, key|
        h[key] = [defaults[key], new_options[key]].compact.join(" ")
        h
      }
    end

  end
end