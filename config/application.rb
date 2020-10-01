require_relative 'boot'

require 'rails/all'
require "view_component/engine"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module CookingBook
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    #     config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    config.i18n.default_locale = :fr

    config.action_view.field_error_proc = Proc.new { |html_tag, instance|
      "<div class=\"has-error\">#{html_tag}</div>".html_safe
    }

    config.action_view.form_with_generates_remote_forms = false
    
    config.autoload_paths += %W(#{config.root}/app/libs)

    config.view_component.preview_path = "#{Rails.root}/spec/components/previews"
  end
end
