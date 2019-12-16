module Bulma
  module Color

    include Stylable

    COLORS = {
        primary: {class: 'primary'},
        link: {class: 'link'},
        info: {class: 'info'},
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

    COLOR_VARIANTS = {
        very_very_light: {class: "very-very-light"},
        very_light: {class: "very-light"},
        lighter: {class: "lighter"},
        light: {class: "light"},
        dark: {class: "dark"},
        darker: {class: "darker"},
        very_dark: {class: "very-dark"},
        very_very_dark: {class: "very-very-dark"}
    }.freeze

    attr_reader :main_color, :background_color, :text_color
    attr_reader :main_color_variant, :background_color_variant, :text_color_variant

    def main_color=(color)
      unless color.nil?
        begin
          base_color = detect_color color
          variant = color != base_color ? detect_color_variant(color) : nil
        rescue ArgumentError => e
          raise ArgumentError, 'Main ' + e.message.downcase
        end

        @main_color = base_color
        @main_color_variant = variant
        add_main_color_styles
      end
    end

    def background_color=(color)
      unless color.nil?
        begin
          base_color = detect_color color
          variant = color != base_color ? detect_color_variant(color) : nil
        rescue ArgumentError => e
          raise ArgumentError, 'Background ' + e.message.downcase
        end

        @background_color = base_color
        @background_color_variant = variant
        add_background_color_styles
      end
    end

    def text_color=(color)
      unless color.nil?
        begin
          base_color = detect_color color
          variant = color != base_color ? detect_color_variant(color) : nil
        rescue ArgumentError => e
          raise ArgumentError, 'Text ' + e.message.downcase
        end

        @text_color = base_color
        @text_color_variant = variant
        add_text_color_styles

      end
    end

    private

    def detect_color(color)
      for valid_color in COLORS.keys
        return valid_color.to_sym if color.to_s.start_with? valid_color.to_s
      end

      raise ArgumentError, 'Color not valid'
    end

    def detect_color_variant(color)
      for valid_variant in COLOR_VARIANTS.keys
        return valid_variant.to_sym if color.to_s.end_with? valid_variant.to_s
      end

      raise ArgumentError, 'Color variant not valid'
    end

    def add_main_color_styles
      unless self.main_color.nil?
        self.styles.append(get_color_css_class 'is', self.main_color, self.main_color_variant)
      end
    end

    def add_background_color_styles
      unless self.background_color.nil?
        self.styles.append(get_color_css_class 'has-background', self.background_color, self.background_color_variant)
      end
    end

    def add_text_color_styles
      unless self.text_color.nil?
        self.styles.append(get_color_css_class 'has-text', self.text_color, self.text_color_variant)
      end
    end

    def get_color_css_class(prefix, color, variant)
      css_class = [prefix, COLORS[color][:class]]
      css_class.append COLOR_VARIANTS[variant][:class] unless variant.nil?
      css_class.join('-')
    end
  end
end