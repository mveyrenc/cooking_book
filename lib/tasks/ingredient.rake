# encoding: utf-8

require 'nokogiri'
require 'open-uri'

namespace :sniffer do
  desc "Sniff recipe web site"
  task ingredient: :environment do
    
    base_url = 'http://cookingbook.archangel.loc/recipes/'
    Recipe.all.each do |recipe|
      url = base_url+recipe.id.to_s+'.json'
      response = open(url) rescue nil
      next unless response
      doc = JSON.parse(response.string)
      recipe.ingredients = doc['ingredients']
      recipe.save
      puts recipe.id.to_s + ' - ' + recipe.name
    end
  end

end
