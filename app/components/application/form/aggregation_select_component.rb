module Application
  module Form
    class AggregationSelectComponent < ViewComponent::Base
      include Application::Form::FieldBaseComponent

      def initialize(
          label:,
          buckets:,
          search_param_name:,
          search_param_value:
      )
        @label = label
        @buckets = buckets
        @search_param_name = search_param_name
        @search_param_value = search_param_value
      end

      private

      attr_reader :label
      attr_reader :buckets
      attr_reader :search_param_name
      attr_reader :search_param_value
    end
  end
end