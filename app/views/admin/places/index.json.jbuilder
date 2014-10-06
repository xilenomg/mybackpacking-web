json.array!(@admin_places) do |admin_place|
  json.extract! admin_place, :id, :country, :state, :city, :place_name, :badge_image, :latitude, :longitude
  json.url admin_place_url(admin_place, format: :json)
end
