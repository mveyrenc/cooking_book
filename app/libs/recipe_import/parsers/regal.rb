module RecipeImport
  module Parsers
    class Regal < Base

      DIFFICULTY_LEVEL_1 = 'Très facile'
      DIFFICULTY_LEVEL_2 = 'Facile'
      DIFFICULTY_LEVEL_3 = 'Not defined'
      DIFFICULTY_LEVEL_4 = 'Confirmé'
      DIFFICULTY_LEVEL_5 = 'Expert'

      COST_LEVEL_1 = 'Bon marché'
      COST_LEVEL_2 = 'Not defined'
      COST_LEVEL_3 = 'Abordable'
      COST_LEVEL_4 = 'Not defined'
      COST_LEVEL_5 = 'Assez cher'

      def name(document)
        extract_first_text document, 'h1.node-title'
      end

      def difficulty(document)
        r = extract_first_text document, '.region-content .field-name-field-difficulty-level .field-items'
        case r
        when DIFFICULTY_LEVEL_1
          [Category.find_by(name: I18n.t("categorization.difficulty.very_easy"),
                           categorization: Categorization::COOKING_DIFFICULTY)]
        when DIFFICULTY_LEVEL_2
          [Category.find_by(name: I18n.t("categorization.difficulty.easy"),
                           categorization: Categorization::COOKING_DIFFICULTY)]
        when DIFFICULTY_LEVEL_3
          [Category.find_by(name: I18n.t("categorization.difficulty.intermediate"),
                           categorization: Categorization::COOKING_DIFFICULTY)]
        when DIFFICULTY_LEVEL_4
          [Category.find_by(name: I18n.t("categorization.difficulty.experienced"),
                           categorization: Categorization::COOKING_DIFFICULTY)]
        when DIFFICULTY_LEVEL_5
          [Category.find_by(name: I18n.t("categorization.difficulty.expert"),
                           categorization: Categorization::COOKING_DIFFICULTY)]
        else
          Array.new
        end
      end

      def cost(document)
        r = extract_first_text document, '.region-content .field-name-field-price-level .field-items'
        case r
        when COST_LEVEL_1
          [Category.find_by(name: I18n.t("categorization.cost.cheap"),
                           categorization: Categorization::COOKING_COST)]
        when COST_LEVEL_2
          [Category.find_by(name: I18n.t("categorization.cost.affordable"),
                           categorization: Categorization::COOKING_COST)]
        when COST_LEVEL_3
          [Category.find_by(name: I18n.t("categorization.cost.middle"),
                           categorization: Categorization::COOKING_COST)]
        when COST_LEVEL_4
          [Category.find_by(name: I18n.t("categorization.cost.pretty_expensive"),
                           categorization: Categorization::COOKING_COST)]
        when COST_LEVEL_5
          [Category.find_by(name: I18n.t("categorization.cost.expensive"),
                           categorization: Categorization::COOKING_COST)]
        else
          Array.new
        end
      end

      def times(document)
        r = Array.new
        pt = extract_first_text document, '.region-content .field-name-field-recipe-preptime .field-items'
        unless pt.nil?
          r << ('Préparation : ' << pt)
        end
        ct = extract_first_text document, '.region-content .field-name-field-recipe-cooktime .field-items'
        unless ct.nil?
          r << ('Cuisson : ' << ct)
        end
        rt = extract_first_text document, '.region-content .field-name-field-recipe-resttime .field-items'
        unless rt.nil?
          r << ('Repos : ' << rt)
        end
        r.join("\n")
      end

      def categories_node(document)
        document.css('.region-content .field-name-categories a')
      end

      def picture_img_node(document)
        document.css('.region-content .field-name-field-images img').first
      end

      def quantity(document)
        extract_first_text document, '.region-content .field-name-field-recipe-yield h2'
      end

      def description(document)
        d = document.css(
            '.region-content .field-name-field-chapo p'
        )
        d.css('a').each do |r|
          r.replace(r.inner_html)
        end
        markdown(d.to_s)
      end

      def ingredients(document)
        r = ''
        l = document.css('.field-name-field-recipe-elements .entity-field-collection-item')
        unless l.nil?
          l.each do |i|
            r << '- ' + markdown(i.text.downcase.strip)
          end
        end
        r.each_line.reject { |x| x.strip == "" }.join
      end

      def directions(document)
        d = document.css(
            '.region-content .field-name-field-recipe-steps p',
            '.region-content .field-name-body p'
        )
        d.css('a').each do |r|
          r.replace(r.inner_html)
        end
        markdown(d.to_s)
      end

      def main_ingredients(document)
        l = categories_node(document)
        r = Array.new
        unless l.nil?
          l.each do |c|
            n = c.text.strip
            e = Categorization::COOKING_MAIN_INGREDIENT.categories.where("lower(name) LIKE ?", n.downcase.chomp('s').downcase << '%').first
            if !e.nil? and !e.is_root?
              r << e
            end
          end
        end
        r
      end

      def sources(document)
        r = super(document)
        e = Categorization::COOKING_SOURCE.categories.where("lower(name) LIKE ?", 'régal').ordered.first
        unless e.nil?
          r << e
        end
        r
      end

      def sources_node(document)
        document.css('.region-content .field-name-field-tags a')
      end
    end

    register :regal_fr, Regal.new
  end
end