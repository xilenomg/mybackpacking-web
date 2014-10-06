json.array!(@admin_users) do |admin_user|
  json.extract! admin_user, :id, :uid, :name, :email, :gender, :sign_in_count, :current_sign_in_at, :last_sign_in_at, :role
  json.url admin_user_url(admin_user, format: :json)
end
