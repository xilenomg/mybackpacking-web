json.array!(@admin_checkins) do |admin_checkin|
  json.extract! admin_checkin, :id, :user, :place
  json.url admin_checkin_url(admin_checkin, format: :json)
end
