module ApplicationFormBuilder
  module Inputs
    module Submit
      extend ActiveSupport::Concern

      include Base

      included do
        def submit_with_application(value = nil, options = {})
          options = options.symbolize_keys!
          classes = [options[:class]]
          classes <<= 'button'
          options[:class] = classes.compact.join(' ')
          submit_without_application(value, options)
        end

        application_alias(:submit)
      end
    end
  end
end
