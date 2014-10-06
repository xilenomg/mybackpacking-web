class Admin::CheckinsController < Admin::ApplicationController
  before_action :set_admin_checkin, only: [:show, :edit, :update, :destroy]

  # GET /admin/checkins
  # GET /admin/checkins.json
  def index
    @admin_checkins = Admin::Checkin.all
  end

  # GET /admin/checkins/1
  # GET /admin/checkins/1.json
  def show
  end

  # GET /admin/checkins/new
  def new
    @admin_checkin = Admin::Checkin.new
  end

  # GET /admin/checkins/1/edit
  def edit
  end

  # POST /admin/checkins
  # POST /admin/checkins.json
  def create
    user = User.find_by_id(admin_checkin_params[:user]) 
    place = Place.find_by_id(admin_checkin_params[:place])
    
    new_params = {:user => user, :place => place} 
    @admin_checkin = Admin::Checkin.new(new_params)

    respond_to do |format|
      if @admin_checkin.save
        format.html { redirect_to @admin_checkin, notice: 'Checkin was successfully created.' }
        format.json { render :show, status: :created, location: @admin_checkin }
      else
        format.html { render :new }
        format.json { render json: @admin_checkin.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/checkins/1
  # PATCH/PUT /admin/checkins/1.json
  def update
    respond_to do |format|
      if @admin_checkin.update(admin_checkin_params)
        format.html { redirect_to @admin_checkin, notice: 'Checkin was successfully updated.' }
        format.json { render :show, status: :ok, location: @admin_checkin }
      else
        format.html { render :edit }
        format.json { render json: @admin_checkin.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/checkins/1
  # DELETE /admin/checkins/1.json
  def destroy
    @admin_checkin.destroy
    respond_to do |format|
      format.html { redirect_to admin_checkins_url, notice: 'Checkin was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_checkin
      @admin_checkin = Admin::Checkin.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_checkin_params
      params.require(:admin_checkin).permit(:user, :place)
    end
end
