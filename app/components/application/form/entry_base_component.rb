module Application
  module Form
    module EntryBaseComponent
      def initialize_entry(
          form:,
          method:,
          resource: nil,
          options: {},
          field_html_options: {},
          label_html_options: {}
      )
        @form = form
        @method = method
        @resource = resource

        initialize_options(options)
        initialize_field_html_options(field_html_options)
        initialize_label_html_options(label_html_options)
      end

      private

      attr_reader :form, :method, :resource
      attr_reader :options
      attr_reader :field_html_options
      attr_reader :has_label, :label_html_options

      def initialize_options(options)
        @options = options
      end

      def initialize_field_html_options(field_html_options)
        @field_html_options = field_html_options
      end

      def initialize_label_html_options(label_html_options)
        @has_label = label_html_options != false
        if @has_label
          @label_html_options = label_html_options
        end
      end
    end
  end
end