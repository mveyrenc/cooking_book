json.array!(@ingredients) do |ingredient|
  json.extract! ingredient, :id, :name, :slug
  json.value ingredient.id
  json.text ingredient.name
  json.url ingredient_url(ingredient, format: :json)
end
