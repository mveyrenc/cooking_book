module Application
  module Elements
    class ButtonDeleteComponent < ButtonBaseComponent

      def initialize(
        name: I18n.t('application.destroy'),
        icon: 'trash',
        icon_only: false
      )
        super
      end

    end
  end
end