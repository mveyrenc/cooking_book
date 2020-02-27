module Bulma
  module Component
    include ActionView::Helpers

    include Alignment
    include Color
    include Responsive
    include Size
    include State
    include Typography

    attr_reader :html_options
    attr_reader :styles

    def html_options=(html_options)
      @html_options = html_options
    end

    def styles=(styles)
      @styles = styles

      self.alignments = styles
      self.colors = styles
      self.sizes = styles
      self.states = styles
      self.typography = styles
    end
  end
end