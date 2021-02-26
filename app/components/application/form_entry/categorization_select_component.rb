module Application::FormEntry
  class CategorizationSelectComponent < Application::FormEntry::BaseComponent

    def initialize(
      form:,
      method:,
      categorization:,
      resource: nil,
      options: {},
      field_html_options: {},
      label_html_options: {}
    )
      options.merge!(
        {
          text: categorization
        }
      )

      field_html_options.merge!(
        {
          id: tag_id(resource, method, categorization),
          multiple: true
        }
      )
      unless categorization.multiple
        field_html_options.merge!({ 'data-application--form-field--collection-select-max-items-value': "1" })
      end

      label_html_options.merge!(
        {
          for: tag_id(resource, method, categorization),
        }
      )
      super(
        form: form,
        method: method,
        resource: resource,
        options: options,
        field_html_options: field_html_options,
        label_html_options: label_html_options
      )

      @categorization = categorization
    end

    def render?
      categorization.categories.any?
    end

    private

    attr_reader :categorization

    def tag_id(resource, method, categorization)
      case
      when resource.nil?
        sanitized_method_name.dup
      when categorization
        "#{sanitized_object_name(resource)}_#{sanitized_method_name(method)}_#{categorization.slug}"
      else
        "#{sanitized_object_name(resource)}_#{sanitized_method_name(method)}"
      end
    end

    def sanitized_object_name(resource)
      @sanitized_object_name ||= resource.class.to_s.downcase.gsub(/\]\[|[^-a-z0-9:.]/, "_").delete_suffix("_")
    end

    def sanitized_method_name(method)
      @sanitized_method_name ||= method.to_s.downcase.delete_suffix("?")
    end
  end
end
