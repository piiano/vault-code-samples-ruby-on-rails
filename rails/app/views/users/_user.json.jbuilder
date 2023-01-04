json.extract! user, :id, :email, :ssn, :name, :created_at, :updated_at
json.url user_url(user, format: :json)
