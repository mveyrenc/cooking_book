module Stylable

  attr_writer :styles
  attr_writer :css_classes

  # Get all CSS classes as array
  def css_classes
    @css_classes ||= default_css_classes.to_a
  end

  # Define default CSS classes
  def default_css_classes
    []
  end

  # Add CSS classes
  #
  #   add_css_classes "style1", "style2"
  def add_css_classes(*args)
    self.css_classes = self.css_classes + args
  end

  # Remove CSS classes
  #
  #   remove_css_classes "style1", "style2"
  def remove_css_classes(*args)
    self.css_classes.reject! {|i| args.include? i}
  end

  # Get de CSS classes related to the CSS classes
  def css_class
    self.css_classes.uniq.join(' ')
  end
end