module Bulma
  module Component
    include Responsive
    include Color
    include Size
    include State
    include Typography

    attr_reader :styles

    def styles=(styles)
      @styles = styles

      self.colors = styles
      self.sizes = styles
      self.typography = styles
      self.states = styles
    end
  end
end