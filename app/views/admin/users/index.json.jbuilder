json.array!(@admin_users) do |admin_user|
  json.extract! admin_user, :id, :first_name, :last_name, :email, :admin
  json.url admin_user_url(admin_user, format: :json)
end
