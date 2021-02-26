module Application
  module Elements
    class ButtonNewComponent < ButtonBaseComponent

      def initialize(
        name: I18n.t('application.new'),
        icon: 'plus',
        icon_only: false
      )
        super
      end
    end
  end
end