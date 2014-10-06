module App::RoutesHelper
	def route_places_link (route)
		link_to route.name, (app_routes_places_path route.id)
	end
end
