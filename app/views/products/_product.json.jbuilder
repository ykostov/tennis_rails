json.extract! product, :id, :name, :description, :start_date, :created_at, :updated_at
json.url product_url(product, format: :json)
