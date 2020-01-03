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

    def outlined=(outlined)
      @outlined = outlined
      add_outlined_style
    end

    def loading=(loading)
      @loading = loading
      add_loading_style
    end

    def disabled=(disabled)
      @disabled = disabled
    end

    private

    def add_outlined_style
      if self.outlined?
        self.add_styles STATE[:outlined][:class]
      else
        self.remove_styles STATE[:outlined][:class]
      end
    end

    def add_loading_style
      if self.loading?
        self.add_styles(STATE[:loading][:class])
      else
        self.remove_styles STATE[:loading][:class]
      end
    end
  end
end