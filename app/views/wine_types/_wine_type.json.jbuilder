json.extract! wine_type, :id, :name, :image_url, :description, :created_at, :updated_at
json.url wine_type_url(wine_type, format: :json)
