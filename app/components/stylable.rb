module Stylable

  attr_writer :styles

  # Get all styles as array
  def styles
    @styles ||= default_styles.to_a
  end

  # Define default styles
  def default_styles
    []
  end

  # Add styles
  #
  #   add_styles "style1", "style2"
  def add_styles(*args)
    self.styles = self.styles + args
  end

  # Get de CSS classes related to the styles
  def css_class
    self.styles.uniq.join(' ')
  end
end