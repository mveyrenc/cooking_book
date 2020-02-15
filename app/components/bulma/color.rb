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

    attr_reader :is_light
    attr_reader :main_color, :background_color, :text_color

    def colors=(styles)
      self.main_color = styles[:color] if styles.key? :color
      self.background_color = styles[:background_color] if styles.key? :background_color
      self.text_color = styles[:text_color] if styles.key? :text_color
      self.is_light = styles[:is_light] if styles.key? :is_light
    end

    private

    def is_light=(is_light)
      @is_light = is_light
      if @is_light
        add_is_light_css_classes
      else
        remove_is_light_css_classes
      end
    end

    def main_color=(color)
      unless color.nil?
        begin
          base_color = detect_color color
        rescue ArgumentError => e
          raise ArgumentError, 'Main ' + e.message.downcase
        end

        @main_color = base_color
        add_main_color_css_classes
      end
    end

    def background_color=(color)
      unless color.nil?
        begin
          base_color = detect_color color
        rescue ArgumentError => e
          raise ArgumentError, 'Background ' + e.message.downcase
        end

        @background_color = base_color
        add_background_color_css_classes
      end
    end

    def text_color=(color)
      unless color.nil?
        begin
          base_color = detect_color color
        rescue ArgumentError => e
          raise ArgumentError, 'Text ' + e.message.downcase
        end

        @text_color = base_color
        add_text_color_css_classes

      end
    end

    def detect_color(color)
      for valid_color in COLORS.keys
        return valid_color.to_sym if color.to_s.start_with? valid_color.to_s
      end

      raise ArgumentError, 'Color not valid'
    end

    def add_is_light_css_classes
      if self.is_light
        self.add_css_classes 'is-light'
      end
    end

    def remove_is_light_css_classes
      if self.is_light
        self.remove_css_classes 'is-light'
      end
    end

    def add_main_color_css_classes
      unless self.main_color.nil?
        self.add_css_classes(get_color_css_class 'is', self.main_color)
      end
    end

    def add_background_color_css_classes
      unless self.background_color.nil?
        self.add_css_classes(get_color_css_class 'has-background', self.background_color)
      end
    end

    def add_text_color_css_classes
      unless self.text_color.nil?
        self.add_css_classes(get_color_css_class 'has-text', self.text_color)
      end
    end

    def get_color_css_class(prefix, color)
      css_class = [prefix, COLORS[color][:class]]
      css_class.join('-')
    end
  end
end