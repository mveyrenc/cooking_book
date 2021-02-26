require 'application_form_builder/form_builder'

module ApplicationFormBuilder
  module FormHelper
    def application_form_with(options = {}, &block)
      options.reverse_merge!(builder: ::ApplicationFormBuilder::FormBuilder)

      _with_application_form_field_error_proc do
        form_with(options, &block)
      end
    end

    def _with_application_form_field_error_proc
      original_proc = ActionView::Base.field_error_proc
      ActionView::Base.field_error_proc = proc do |html_tag, _instance_tag|
        html_tag
      end
      yield
    ensure
      ActionView::Base.field_error_proc = original_proc
    end
  end
end
