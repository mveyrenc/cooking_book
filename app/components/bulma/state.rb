module Bulma
  module State

    include Stylable

    STATE = {
        outlined: {class: 'is-outlined'},
        loading: {class: 'is-loading'},
        disabled: {disabled: true}
    }.freeze

    attr_reader :outlined, :loading, :disabled

    alias :outlined? :outlined
    alias :loading? :loading
    alias :disabled? :disabled

    def states=(styles)
      self.outlined = styles[:outlined] if styles.key? :outlined
      self.loading = styles[:loading] if styles.key? :loading
    end

    def disabled=(disabled)
      @disabled = disabled
    end

    private

    def outlined=(outlined)
      @outlined = outlined
      add_outlined_style
    end

    def loading=(loading)
      @loading = loading
      add_loading_style
    end

    private

    def add_outlined_style
      if self.outlined?
        self.add_css_classes STATE[:outlined][:class]
      else
        self.remove_css_classes STATE[:outlined][:class]
      end
    end

    def add_loading_style
      if self.loading?
        self.add_css_classes(STATE[:loading][:class])
      else
        self.remove_css_classes STATE[:loading][:class]
      end
    end
  end
end