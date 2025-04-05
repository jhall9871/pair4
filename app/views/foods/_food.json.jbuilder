json.extract! food, :id, :name, :food_subtype_id, :created_at, :updated_at
json.url food_url(food, format: :json)
