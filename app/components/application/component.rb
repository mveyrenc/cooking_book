module Application
  module Component
    include ActionView::Helpers

    include Alignment
    include Color
    include Responsive
    include Size
    include State
    include Typography

    attr_accessor :html_options
    attr_accessor :styles

    def compute_styles
      self.alignments = styles
      self.colors = styles
      self.sizes = styles
      self.states = styles
      self.typography = styles
    end
  end
end