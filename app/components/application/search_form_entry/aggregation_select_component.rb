module Application::SearchFormEntry
  class AggregationSelectComponent < Application::FormEntry::BaseComponent

    def initialize(
      form:,
      method:,
      resource: nil,
      options: {},
      field_html_options: {},
      label_html_options: {},
      buckets:,
      search_param_name:,
      search_param_value:
    )
      super(
        form: form,
        method: method,
        resource: resource,
        options: options,
        field_html_options: field_html_options,
        label_html_options: label_html_options
      )

      @buckets = buckets
      @search_param_name = search_param_name
      @search_param_value = search_param_value
    end

    private

    attr_reader :buckets
    attr_reader :search_param_name
    attr_reader :search_param_value
  end
end