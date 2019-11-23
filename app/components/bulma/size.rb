module Bulma
  module Size
    include Stylable

    SIZE = {
        small: {class: 'is-small'},
        medium: {class: 'is-medium'},
        large: {class: 'is-large'}
    }.freeze

    attr_reader :size

    def size=(size)
      unless size.nil?
        raise ArgumentError, 'Size not valid' unless SIZE.key? size

        @size = size
        add_size_styles
      end
    end

    private
    
    def add_size_styles
      unless self.size.nil?
        self.styles.append(SIZE[self.size][:class])
      end
    end
  end
end