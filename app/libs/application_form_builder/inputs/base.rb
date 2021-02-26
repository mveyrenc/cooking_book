module ApplicationFormBuilder
  module Inputs
    module Base
      extend ActiveSupport::Concern

      class_methods do
        def application_alias(field_name)
          alias_method "#{field_name}_without_application".to_sym, field_name
          alias_method field_name, "#{field_name}_with_application".to_sym
        end
      end
    end
  end
end
