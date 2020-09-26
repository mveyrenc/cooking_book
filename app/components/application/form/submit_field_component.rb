module Application
  module Form
    class SubmitFieldComponent < ViewComponent::Base
      def initialize(
          form:,
          value: nil,
          resource: nil,
          options: {},
          html_options: {}
      )
        @form = form
        @value = value
        @resource = resource

        initialize_options(options)
        initialize_html_options(html_options)
      end

      def call
        form.submit value, html_options
      end

      private

      attr_reader :form, :value, :resource
      attr_reader :options, :html_options

      def initialize_options(options)
        @options = options
      end

      def default_html_options
        default_options = {class: 'button is-primary'}
        if is_disabled
          default_options[:disabled] = true
        end
        default_options
      end

      def initialize_html_options(html_options)
        @html_options = merge_options(default_html_options, html_options)
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
end