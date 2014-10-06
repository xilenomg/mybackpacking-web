class App::ApplicationController < ApplicationController
	before_filter :authenticate_app
	layout 'app_application'

	def index
	end
	
end
