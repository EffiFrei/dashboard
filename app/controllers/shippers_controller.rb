class ShippersController < ApplicationController
  before_action :set_shipper, only: [:show, :edit, :update, :destroy]
  before_action :logged_in_admin, only: [:index, :new, :destroy]
  before_action :correct_shipper, only: [:edit, :show]

  # GET /shippers
  # GET /shippers.json
  def index
    @shippers = Shipper.all
  end

  # GET /shippers/1
  # GET /shippers/1.json
  def show
  end

  def dashboard
    @requests = Request.all
  end

  # GET /shippers/new
  def new
    @shipper = Shipper.new
  end

  # GET /shippers/1/edit
  def edit
  end

  # POST /shippers
  # POST /shippers.json
  def create
    @shipper = Shipper.new(shipper_params)

    respond_to do |format|
      if @shipper.save
        format.html { redirect_to @shipper, notice: 'Shipper was successfully created.' }
        format.json { render :show, status: :created, location: @shipper }
      else
        format.html { render :new }
        format.json { render json: @shipper.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /shippers/1
  # PATCH/PUT /shippers/1.json
  def update
    respond_to do |format|
      if @shipper.update(shipper_params)
        format.html { redirect_to @shipper, notice: 'Shipper was successfully updated.' }
        format.json { render :show, status: :ok, location: @shipper }
      else
        format.html { render :edit }
        format.json { render json: @shipper.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shippers/1
  # DELETE /shippers/1.json
  def destroy
    @shipper.destroy
    respond_to do |format|
      format.html { redirect_to shippers_url, notice: 'Shipper was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shipper
      @shipper = Shipper.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def shipper_params
      params.require(:shipper).permit(:name, :address, :poc, :email, :phone, :org_type, :PAN, :ST_num, :CIN, :reg_date)
    end

    def correct_shipper
      if carrier_signed_in?
        redirect_to carrier_path(current_carrier)
      elsif driver_signed_in?
        redirect_to driver_path(current_driver)
      elsif admin_signed_in?
      elsif shipper_signed_in?
        if current_shipper == @shipper
        else
          redirect_to shipper_path(current_shipper)
        end
      else
        redirect_to new_shipper_session_path
      end
    end
end
