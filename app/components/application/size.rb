module Application
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

    def size=(size)
      unless size.nil?
        size = size.to_sym

        raise ArgumentError, "Size #{size} not valid" unless SIZE.key? size

        @size = size
        add_css_classes(SIZE[size][:class])
      end
    end
  end
end