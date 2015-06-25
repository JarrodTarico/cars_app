class PostVehiclesController < ApplicationController
  before_action :set_post_vehicle, only: [:show, :edit, :update, :destroy]

  # GET /post_vehicles
  # GET /post_vehicles.json
  def index
    @post_vehicles = PostVehicle.all
  end

  # GET /post_vehicles/1
  # GET /post_vehicles/1.json
  def show
  end

  # GET /post_vehicles/new
  def new
    @post_vehicle = PostVehicle.new
  end

  # GET /post_vehicles/1/edit
  def edit
  end

  # POST /post_vehicles
  # POST /post_vehicles.json
  def create
    @post_vehicle = PostVehicle.new(post_vehicle_params)

    respond_to do |format|
      if @post_vehicle.save
        format.html { redirect_to @post_vehicle, notice: 'Post vehicle was successfully created.' }
        format.json { render :show, status: :created, location: @post_vehicle }
      else
        format.html { render :new }
        format.json { render json: @post_vehicle.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /post_vehicles/1
  # PATCH/PUT /post_vehicles/1.json
  def update
    respond_to do |format|
      if @post_vehicle.update(post_vehicle_params)
        format.html { redirect_to @post_vehicle, notice: 'Post vehicle was successfully updated.' }
        format.json { render :show, status: :ok, location: @post_vehicle }
      else
        format.html { render :edit }
        format.json { render json: @post_vehicle.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /post_vehicles/1
  # DELETE /post_vehicles/1.json
  def destroy
    @post_vehicle.destroy
    respond_to do |format|
      format.html { redirect_to post_vehicles_url, notice: 'Post vehicle was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post_vehicle
      @post_vehicle = PostVehicle.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_vehicle_params
      params.require(:post_vehicle).permit(:heading, :body, :price, :neighborhood, :external_url, :timestamp)
    end
end
