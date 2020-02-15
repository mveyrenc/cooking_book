module Bulma
  module Size
    include Stylable

    SIZE = {
        small: {class: 'is-small'},
        medium: {class: 'is-medium'},
        large: {class: 'is-large'}
    }.freeze

    attr_reader :size

    def sizes=(styles)
      self.size = styles[:size] if styles.key? :size
    end

    private

    def size=(size)
      unless size.nil?
        raise ArgumentError, "Size #{size} not valid" unless SIZE.key? size

        @size = size
        add_size_css_classes
      end
    end

    def add_size_css_classes
      unless self.size.nil?
        self.add_css_classes(SIZE[self.size][:class])
      end
    end
  end
end