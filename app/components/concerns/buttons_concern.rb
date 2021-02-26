module ButtonsConcern
  extend ActiveSupport::Concern

  included do
    def new_button_css_classes
      default_button_css_classes
    end

    def new_button_title
      I18n.t('application.new')
    end

    def edit_button_css_classes
      'button is-small is-light'
    end

    def edit_button_title
      I18n.t('application.edit')
    end

    def delete_button_css_classes
      default_button_css_classes
    end

    def delete_button_title
      I18n.t('application.destroy')
    end

    def delete_button_method
      :delete
    end

    def delete_button_data
      { confirm: I18n.t('application.destroy_confirmation') }
    end

    private

    def default_button_css_classes
      'button is-small is-light'
    end
  end
end