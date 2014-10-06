class Admin::PlacesController < Admin::ApplicationController
  before_action :set_place, only: [:show, :edit, :update, :destroy]

  # GET /admin/places
  # GET /admin/places.json
  def index
    @admin_places = Admin::Place.all
  end

  # GET /admin/places/1
  # GET /admin/places/1.json
  def show
  end

  # GET /admin/places/new
  def new
    @admin_place = Admin::Place.new
  end

  # GET /admin/places/1/edit
  def edit
  end

  # POST /admin/places
  # POST /admin/places.json
  def create
    @admin_place = Admin::Place.new(admin_place_params)

    respond_to do |format|
      if @admin_place.save
        format.html { redirect_to @admin_place, notice: 'Place was successfully created.' }
        format.json { render :show, status: :created, location: @admin_place }
      else
        format.html { render :new }
        format.json { render json: @admin_place.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/places/1
  # PATCH/PUT /admin/places/1.json
  def update
    respond_to do |format|
      if @admin_place.update(admin_place_params)
        format.html { redirect_to @admin_place, notice: 'Place was successfully updated.' }
        format.json { render :show, status: :ok, location: @admin_place }
      else
        format.html { render :edit }
        format.json { render json: @admin_place.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/places/1
  # DELETE /admin/places/1.json
  def destroy
    @admin_place.destroy
    respond_to do |format|
      format.html { redirect_to admin_places_url, notice: 'Place was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_place
      @admin_place = Admin::Place.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_place_params
      params.require(:admin_place).permit(:country, :state, :city, :place_name, :badge_image, :latitude, :longitude)
    end
end
