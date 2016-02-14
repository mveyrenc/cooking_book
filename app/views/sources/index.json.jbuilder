json.array!(@sources) do |source|
  json.extract! source, :id, :name, :slug
  json.value source.id
  json.text source.name
  json.url source_url(source, format: :json)
end
