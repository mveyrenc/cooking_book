module Application
  module Elements
    class ButtonEditComponent < ButtonBaseComponent

      def initialize(
        name: I18n.t('application.edit'),
        icon: 'edit',
        icon_only: false
      )
        super
      end

    end
  end
end