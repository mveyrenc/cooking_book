module RecipeImport
  module Parsers
    class MeilleurDuChef < Base

      DIFFICULTY_LEVEL_1 = 'width:33.3333333333333%'
      DIFFICULTY_LEVEL_2 = 'Not defined'
      DIFFICULTY_LEVEL_3 = 'width:66.6666666666666%'
      DIFFICULTY_LEVEL_4 = 'Not defined'
      DIFFICULTY_LEVEL_5 = 'width:100%'

      def name(document)
        extract_first_text document, '#page-content h1'
      end

      def difficulty(document)
        n = document.css('#page-content .difficulty-bar .pc').first
        unless n.nil?
          case n["style"]
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
      end

      def times(document)
        r = ''
        n = document.css('#infos-section .infos-recette .info')
        n.each do |i|
          t = i.text.strip
          if t.start_with? 'Durée'
            r = t
            break
          end
        end
        r
      end

      def categories_node(document)
        document.css('#page-content #compass span[itemprop=title]')
      end

      def picture_img_node(document)
        document.css('#page-content #media-section .media-display img').first
      end

      def quantity(document)
        r = ''
        n = document.css('#infos-section .infos-recette .info')
        n.each do |i|
          t = i.text.strip
          if t.start_with? 'Pour'
            r = t
            break
          end
        end
        r
      end

      def ingredients(document)
        r = ''
        n = document.css('#page-content .ingredients ul')
        n.each do |i|
          i.children.each do |li|
            if li.content == 'Matériel utilisé :'
              break
            end
            if li.attr('class') == 'subtitle'
              r << "\n**%s**\n" % li.text
            else
              li.css("a").each do |a|
                a.replace(a.content)
              end
              r << markdown(li.to_s)
            end
          end
        end
        r
      end

      def description(document)
        r = extract_first_text document, '#page-content #presentation .texte'
        unless r.nil?
          markdown(r)
        end
      end

      def directions(document)
        r = ''
        n = document.css('#page-content #instructions-section .instructions .instruction')
        n.each do |i|
          i.css("a").each do |a|
            a.replace(a.content)
          end
          p = i.css('p')
          t = p.css('strong').first
          unless t.nil?
            r << "\n# %s\n" % t.text
            t.remove
          end
          r << i.css('.num').first.content.chomp << '. ' << markdown(i.css('p').to_s).chomp
        end
        r
      end

      def sources(document)
        r = super(document)
        e = Categorization::COOKING_SOURCE.categories.where("lower(name) LIKE ?", 'meilleur du chef').ordered.first
        unless e.nil?
          r << e
        end
        r
      end

      def sources_node(document)
        document.css('#page-content meta[itemprop=author]')
      end
    end

    register :meilleurduchef_com, MeilleurDuChef.new
  end
end