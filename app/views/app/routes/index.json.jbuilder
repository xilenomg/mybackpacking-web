json.array!(@app_routes) do |app_route|
  json.extract! app_route, :id, :name, :user_id
  json.url app_route_url(app_route, format: :json)
end
