require 'rails/railtie'

module ApplicationFormBuilder
  class Railtie < Rails::Railtie
    initializer :application_form_builder do
      ActiveSupport.on_load(:action_view) do
        require 'application_form_builder/form_helper'
        include ApplicationFormBuilder::FormHelper
      end
    end
  end
end
