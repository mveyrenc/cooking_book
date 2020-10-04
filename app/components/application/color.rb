module Application
  module Color

    include Stylable

    COLORS = {
        primary: {class: 'primary'},
        cooking: {class: 'cooking'},
        healthwellness: {class: 'healthwellness'},
        house: {class: 'house'},
        link: {class: 'link'},
        info: {class: 'info'},
        notice: {class: 'notice'},
        success: {class: 'success'},
        warning: {class: 'warning'},
        danger: {class: 'danger'},
        deep_yellow: {class: 'deep-yellow'},
        yellow: {class: 'yellow'},
        orange: {class: 'orange'},
        deep_orange: {class: 'deep-orange'},
        red: {class: 'red'},
        pink: {class: 'pink'},
        deep_purple: {class: 'deep-purple'},
        purple: {class: 'purple'},
        indigo: {class: 'indigo'},
        blue: {class: 'blue'},
        light_blue: {class: 'light-blue'},
        cyan: {class: 'cyan'},
        teal: {class: 'teal'},
        turquoise: {class: 'turquoise'},
        light_green: {class: 'light-green'},
        green: {class: 'green'},
        brown: {class: 'brown'},
        charcoal: {class: 'charcoal'},
        gray_dark: {class: 'gray-dark'},
        asphalt: {class: 'asphalt'},
        gray: {class: 'gray'},
    }.freeze

    attr_reader :is_light
    attr_reader :main_color, :background_color, :text_color

    def colors=(styles)
      self.main_color = styles[:color] if styles.key? :color
      self.background_color = styles[:background_color] if styles.key? :background_color
      self.text_color = styles[:text_color] if styles.key? :text_color
      self.is_light = styles[:is_light] if styles.key? :is_light
    end

    def main_color=(color)
      unless color.nil?
        color = color.to_sym

        raise ArgumentError, "Color #{color} not valid" unless COLORS.key? color

        @main_color = color
        add_css_classes('is-' + COLORS[color][:class])
      end
    end

    def background_color=(color)
      unless color.nil?
        color = color.to_sym

        raise ArgumentError, "Background color #{color} not valid" unless COLORS.key? color

        @background_color = color
        add_css_classes('has-background-' + COLORS[color][:class])
      end
    end

    def text_color=(color)
      unless color.nil?
        color = color.to_sym

        raise ArgumentError, "Text color #{color} not valid" unless COLORS.key? color

        @text_color = color
        add_css_classes('has-text-' + COLORS[color][:class])
      end
    end

    def is_light=(is_light)
      @is_light = is_light
      if @is_light
        add_css_classes 'is-light'
      else
        remove_css_classes 'is-light'
      end
    end
  end
end