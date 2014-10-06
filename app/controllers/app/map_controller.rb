class App::MapController < App::ApplicationController
	def index
		@places = current_user.place.order('`checkins`.created_at desc')
	end
end
