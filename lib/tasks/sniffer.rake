# encoding: utf-8

require 'nokogiri'
require 'open-uri'

namespace :sniffer do
  desc "Sniff recipe web site"
  task bonappetit: :environment do
    default_dish_type = DishType.find_or_create_by(name: 'À trier')
    entree_dish_type = DishType.find_by_name('Entrée')
    plat_dish_type = DishType.find_by_name('Plat')
    dessert_dish_type = DishType.find_by_name('Dessert')
    
    plat_viande_category = Category.find_by_name('Plats de viandes')
    plat_volaille_category = Category.find_by_name('Plats de volailles')
    plat_poisson_category = Category.find_by_name('Plats de poissons')
    accompagnement_category = Category.find_by_name('Légumes & accompagnements')
    default_category = Category.find_or_create_by(name: 'À trier')
    
    base_url = 'http://arnaud.masart.free.fr/bonapetit/bon%20appetit/bonappetitbiensur.france3.fr/'
    lettres = {
      "a" => "recherche_recettesc52d.html?mode=alphabet&lettre=a",
      "b" => "recherche_recettesc399.html?mode=alphabet&lettre=b",
      "c" => "recherche_recettes1341.html?mode=alphabet&lettre=c",
      "d" => "recherche_recettes9a1e.html?mode=alphabet&lettre=d",
      "e" => "recherche_recettesb8f0.html?mode=alphabet&lettre=e",
      "f" => "recherche_recettesabd4.html?mode=alphabet&lettre=f",
      "g" => "recherche_recettes4fe4.html?mode=alphabet&lettre=g",
      "h" => "recherche_recettes384e.html?mode=alphabet&lettre=h",
      "i" => "recherche_recettesacb9.html?mode=alphabet&lettre=i",
      "j" => "recherche_recettesdfdc.html?mode=alphabet&lettre=j",
      "k" => "recherche_recettesb67f.html?mode=alphabet&lettre=k",
      "l" => "recherche_recettesc7c1.html?mode=alphabet&lettre=l",
      "m" => "recherche_recettesecbf.html?mode=alphabet&lettre=m",
      "n" => "recherche_recettes7fac.html?mode=alphabet&lettre=n",
      "o" => "recherche_recettes51b2.html?mode=alphabet&lettre=o",
      "p" => "recherche_recettes42f3.html?mode=alphabet&lettre=p",
      "q" => "recherche_recettes94d3.html?mode=alphabet&lettre=q",
      "r" => "recherche_recettes0305.html?mode=alphabet&lettre=r",
      "s" => "recherche_recettes8797.html?mode=alphabet&lettre=s",
      "t" => "recherche_recettes8fac.html?mode=alphabet&lettre=t",
      "u" => "recherche_recettes6aa7.html?mode=alphabet&lettre=u",
      "v" => "recherche_recettesf605.html?mode=alphabet&lettre=v",
      "w" => "recherche_recettese903.html?mode=alphabet&lettre=w",
      "x" => "recherche_recettes58c1.html?mode=alphabet&lettre=x",
      "y" => "recherche_recettes0297.html?mode=alphabet&lettre=y",
      "z" => "recherche_recettesed01.html?mode=alphabet&lettre=z"
      
    }
    lettres.each do |letter, url|
      response = open(base_url+url) rescue nil
      next unless response
      doc = Nokogiri::HTML(response)
      doc.xpath('//a[contains(@class, "etxtnoir14")]').each do |link|
        recipe_link = link.attribute('href')
        #        puts base_url + recipe_link
        response = open(base_url + recipe_link) rescue nil
        next unless response
        repice_doc = Nokogiri::HTML(response)
        recipe_table = repice_doc.xpath('//td[contains(@class, "txtnoir12")]/table/tr')
        if !recipe_table[5].nil? and !recipe_table[9].nil?
          recipe_name = link.content.gsub( /\(([^>]*)\)/, "" ).strip
          recipe = Recipe.find_or_create_by( name: recipe_name, source: 'Bon appétit, bien sûr !' )
          if recipe.new_record?
            #            puts recipe_name
#            recipe.description = "Recette de " + link.content.scan( /\(([^>]*)\)/).last.first
            table_row_5_content = recipe_table[5].content.strip.gsub( /^$\n*/, '' ).gsub(/[[:blank:]]/, ' ').lines
#            recipe.quantity = table_row_5_content.shift.gsub("\n", '').gsub("Recette ", '').gsub("Ingrédiénts ", '').gsub("Ingédients ", '').gsub("Ingrédients ", '').gsub(":", '').gsub("deux", '2').gsub("per.", 'personnes').gsub("pers.", 'personnes').gsub("PERS", 'personnes').capitalize.strip
            recipe.ingredients =  "<ul>" + table_row_5_content.map{ |r| "<li>" + r.strip.gsub( /^( |-)+/, "" ).strip + "</li>" }.join("\n") + "</ul>"
#            recipe.directions = '<p>' + recipe_table[9].content.gsub(/[[:blank:]]/, ' ').strip.gsub( /^$\n*/, "</p>\n<p>" ).gsub( /[1-9]+\)( )*/, '') + '</p>'
#            recipe_img = repice_doc.xpath('//img[contains(@class, "spip_logos")]')
#            if recipe_img[0]
#              recipe_img_url = base_url + recipe_img[0].attr('src')
#              begin
#                response = URI.parse(recipe_img_url)
#                recipe.picture = response if response
#              rescue => e
#                puts "Image introuvable : " + recipe_img_url
#              end
#            end
#            recipe_dish_type = repice_doc.xpath('//td[contains(@class, "etxtnoir11g")]/span[contains(@class, "etxtnoir16g")]').inner_text
#            if recipe_dish_type.include? "entrée"
#              recipe.dish_type = entree_dish_type
#            elsif recipe_dish_type.include? "plat"
#              recipe.dish_type = plat_dish_type
#            elsif recipe_dish_type.include? "accompagnement"
#              recipe.dish_type = plat_dish_type
#            elsif recipe_dish_type.include? "dessert"
#              recipe.dish_type = dessert_dish_type
#            else
#              recipe.dish_type = default_dish_type
#            end
#            if recipe_dish_type.include? "accompagnement"
#              recipe.categories = [accompagnement_category, default_category]
#            elsif recipe_dish_type.include? "plat de viande"
#              recipe.categories = [plat_viande_category, default_category]
#            elsif recipe_dish_type.include? "plat de volaille"
#              recipe.categories = [plat_volaille_category, default_category]
#            elsif recipe_dish_type.include? "plat de poisson"
#              recipe.categories = [plat_poisson_category, default_category]
#            else
#              recipe.categories = [default_category]
#            end
            recipe.save
            puts recipe.id.to_s + ' - ' + recipe.name
          end
        end
      end
    end
  end

end
