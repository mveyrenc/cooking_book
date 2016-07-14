# encoding: utf-8

namespace :migrate do
  desc "Migrate sources"
  task data_sources: :environment do
    
    Recipe.all.each do |recipe|
      source_names = recipe.source.split(';').map{|s| s.strip }.reject{ |s| s.empty? }
      source_names.each do |source_name|
        source = Source.find_or_create_by(name: source_name)
        recipe.sources << source
      end
      recipe.save
    end
  end

end
