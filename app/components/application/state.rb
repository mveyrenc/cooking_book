module Application
  module State

    include Stylable

    STATE = {
      outlined: { class: 'is-outlined' },
      loading: { class: 'is-loading' }
    }.freeze

    attr_reader :outlined, :loading

    alias :outlined? :outlined
    alias :loading? :loading

    def states=(styles)
      self.outlined = styles[:outlined] if styles.key? :outlined
      self.loading = styles[:loading] if styles.key? :loading
    end

    def outlined=(outlined)
      if outlined
        @outlined = true
        add_css_classes(STATE[:outlined][:class])
      end
    end

    def loading=(loading)
      if loading
        @loading = true
        add_css_classes(STATE[:loading][:class])
      end
    end
  end
end