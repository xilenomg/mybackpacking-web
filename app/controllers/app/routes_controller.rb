class App::RoutesController < App::ApplicationController
  before_action :set_app_route, only: [:show, :edit, :update, :destroy]
  helper App::RoutesHelper
  
  # GET /app/routes
  # GET /app/routes.json
  def index
    @app_routes = App::Route.all.where(user_id: @current_user.id)
  end

  # GET /app/routes/1
  # GET /app/routes/1.json
  def show
  end

  # GET /app/routes/new
  def new
    @app_route = App::Route.new
  end

  # GET /app/routes/1/edit
  def edit
  end

  # GET /app/routes/1/places
  def route_places
  end

  # POST /app/routes
  # POST /app/routes.json
  def create
    new_params = app_route_params.merge({:user_id => current_user.id})
    puts new_params
    @app_route = App::Route.new(new_params)

    respond_to do |format|
      if @app_route.save
        format.html { redirect_to @app_route, notice: 'Route was successfully created.' }
        format.json { render :show, status: :created, location: @app_route }
      else
        format.html { render :new }
        format.json { render json: @app_route.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /app/routes/1
  # PATCH/PUT /app/routes/1.json
  def update
    respond_to do |format|
      if @app_route.update(app_route_params)
        format.html { redirect_to @app_route, notice: 'Route was successfully updated.' }
        format.json { render :show, status: :ok, location: @app_route }
      else
        format.html { render :edit }
        format.json { render json: @app_route.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /app/routes/1
  # DELETE /app/routes/1.json
  def destroy
    @app_route.destroy
    respond_to do |format|
      format.html { redirect_to app_routes_url, notice: 'Route was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_app_route
      @app_route = App::Route.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def app_route_params
      params.require(:app_route).permit(:name)
    end
end
