json.extract! password, :id, :url, :username, :password, :created_at, :updated_at
json.url password_url(password, format: :json)
