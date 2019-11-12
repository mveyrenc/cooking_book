module Bulma
  module Form
    module Submit
      class Entry < ActionView::Component::Base
        validates :form, presence: true

        def initialize(
            form:,
            value: nil,
            resource: nil,
            options: {},
            field_html_options: {}
        )
          @form = form
          @value = value
          @resource = resource
          @options = options
          @field_html_options = field_html_options
        end

        private

        attr_reader :form, :value, :resource
        attr_reader :options
        attr_reader :field_html_options
      end
    end
  end
end