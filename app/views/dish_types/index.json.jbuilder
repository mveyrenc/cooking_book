json.array!(@dish_types) do |dish_type|
  json.extract! dish_type, :id, :name, :plurial_name
  json.url dish_type_url(dish_type, format: :json)
end
