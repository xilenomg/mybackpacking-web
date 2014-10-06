class App::CheckinController < App::ApplicationController
	
	# GET /app/checkin
	def index
	end 

	# POST /app/checkin/create.json
	def create
		user = User.find_by_id(current_user.id) 
	    place = Place.find_by_country_and_state_and_city(params[:country][:long_name], params[:state][:long_name], params[:city][:long_name])
	    
	    if place.nil?
	    	place = Place.new({
	    		:country => params[:country][:long_name], 
	    		:state => params[:state][:long_name], 
	    		:city => params[:city][:long_name], 
	    		:latitude => params[:latitude], 
	    		:longitude => params[:longitude]
	    	})

	    	if !place.save
	    		render :json => {:success => false }, :status => 500
	    		return
	    	end 
	    else
	    	checkin = Checkin.all.where("created_at > ?", 4.hours.ago).where(:user_id => current_user.id)
	    	if !checkin.empty?
	    		render :json => {:success => false, :error_message => "You were here already", :error_code => "CHECKIN_EXISTS" }, :status => 412
	    		return
	    	end
	    end

	    new_params = {:user => user, :place => place} 
	    @admin_checkin = Checkin.new(new_params)

	    if @admin_checkin.save
			render :json => {:success => true}
		else
			render :json => {:success => false }, :status => 500
		end
	end
end
