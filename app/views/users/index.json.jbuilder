json.array!(@users) do |user|
  json.extract! user, :name, :email, :signup_date, :last_access
  json.url user_url(user, format: :json)
end
