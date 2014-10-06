class WelcomeController < ApplicationController
	layout 'application'
	def index
		redirect_to :app if !current_user.nil?
	end
end
