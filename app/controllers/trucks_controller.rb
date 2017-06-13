class TrucksController < ApplicationController
  before_action :set_truck, only: [:show, :edit, :update, :destroy]

  # GET /trucks
  # GET /trucks.json
  def index
    @trucks = Truck.all
  end

  # GET /trucks/1
  # GET /trucks/1.json
  def show
  end

  # GET /trucks/new
  def new
    @truck = Truck.new
  end

  # GET /trucks/1/edit
  def edit
  end

  # POST /trucks
  # POST /trucks.json
  def create
    @carrier = Carrier.find(params[:carrier_id])
    @truck = @carrier.trucks.create(truck_params)

    respond_to do |format|
      if @truck.save
        format.html { redirect_to carrier_dash_path, notice: 'Truck was successfully created.' }
        format.json { render :show, status: :created, location: @truck }
      else
        format.html { render :new }
        format.json { render json: @truck.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /trucks/1
  # PATCH/PUT /trucks/1.json
  def update
    respond_to do |format|
      if @truck.update(truck_params)
        format.html { redirect_to carrier_dash_path, notice: 'Truck was successfully updated.' }
        format.json { render :show, status: :ok, location: @truck }
      else
        format.html { render :edit }
        format.json { render json: @truck.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /trucks/1
  # DELETE /trucks/1.json
  def destroy
    @truck.destroy
    respond_to do |format|
      format.html { redirect_to carrier_dash_path, notice: 'Truck was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_truck
      # @carrier = Carrier.find(params[:carrier_id])
      @truck = Truck.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def truck_params
      params.require(:truck).permit(
        :registration_num,
        :engine_num,
        :chasis_num,
        :manufacturer,
        :model,
        :load_capacity,
        :load_height,
        :load_width,
        :load_base_length,
        :registration_auth,
        :fitness,
        :purchase_date,
        :insurer,
        :policy_num,
        :insurance_expiry,
        :permit_expiry,
        :gross_vehicle_weight,
        :unloaded_weight,
        :body_type,
        :current_location,
        :current_status)
    end
end
