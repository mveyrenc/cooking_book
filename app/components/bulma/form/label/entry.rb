module Bulma
  module Form
    module Label
      class Entry < ActionView::Component::Base
        include Bulma::Form::EntryBase

        alias_method :html_options, :field_html_options

        validates :form, :method, presence: true

        def initialize(
            form:,
            method:,
            resource: nil,
            options: {},
            html_options: {}
        )
          initialize_entry(
              form: form,
              method: method,
              resource: resource,
              options: options,
              field_html_options: html_options
          )
        end

        private

        attr_reader :text

        def has_label
          text = options.fetch(:text, nil)
          text.nil? || !text.blank?
        end
      end
    end
  end
end