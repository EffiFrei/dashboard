class CarriersController < ApplicationController
  before_action :set_carrier, only: [:show, :edit, :update, :destroy]
  before_action :logged_in_admin, only: [:index, :new, :destroy]
  before_action :correct_carrier, only: [:edit, :show]

  # GET /carriers
  # GET /carriers.json
  def index
    @carriers = Carrier.all
  end

  # GET /carriers/1
  # GET /carriers/1.json
  def show
  end

  def dashboard
    @trucks   = current_carrier.trucks
    @drivers  = current_carrier.drivers
    @requests = current_carrier.requests
  end

  # GET /carriers/new
  def new
    @carrier = Carrier.new
  end

  # GET /carriers/1/edit
  def edit
  end

  # POST /carriers
  # POST /carriers.json
  def create
    @carrier = Carrier.new(carrier_params)

    respond_to do |format|
      if @carrier.save
        format.html { redirect_to @carrier, notice: 'Carrier was successfully created.' }
        format.json { render :show, status: :created, location: @carrier }
      else
        format.html { render :new }
        format.json { render json: @carrier.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /carriers/1
  # PATCH/PUT /carriers/1.json
  def update
    respond_to do |format|
      if @carrier.update(carrier_params)
        format.html { redirect_to @carrier, notice: 'Carrier was successfully updated.' }
        format.json { render :show, status: :ok, location: @carrier }
      else
        format.html { render :edit }
        format.json { render json: @carrier.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /carriers/1
  # DELETE /carriers/1.json
  def destroy
    @carrier.destroy
    respond_to do |format|
      format.html { redirect_to carriers_url, notice: 'Carrier was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_carrier
      @carrier = Carrier.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def carrier_params
      params.require(:carrier).permit(:name, :PoC, :address, :phone, :email, :reg_date, :owner_name, :org_type, :PAN, :ST_num, :incorporation_date, :CIN)
    end

    def correct_carrier
      if shipper_signed_in?
        redirect_to shipper_path(current_shipper)
      elsif driver_signed_in?
        redirect_to driver_path(current_driver)
      elsif admin_signed_in?
      elsif carrier_signed_in?
        if current_carrier == @carrier
        else
          redirect_to carrier_path(current_carrier)
        end
      else
        redirect_to new_carrier_session_path
      end
    end
end
