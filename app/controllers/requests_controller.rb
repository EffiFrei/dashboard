class RequestsController < ApplicationController
  before_action :set_request, only: [:show, :edit, :update, :destroy]
  before_action :logged_in, only: [:index, :show]
  before_action :admin_shipper, only: [:new, :edit]
  before_action :logged_in_admin, only: [:destroy]

  def index
    @requests = Request.all
  end

  def create
    @request = Request.new(request_params)
    if @request.save
      redirect_to @request
    else
      render 'new'
    end
  end

  def new
    @request = Request.new
  end

  def edit
  end

  def show
  end

  def update
    if @request.update(request_params)
      redirect_to @request
    else
      render 'edit'
    end
  end

  def destroy
    @request.destroy

    redirect_to requests_path
  end

  private
    def set_request
      @request = Request.find(params[:id])
    end

    def request_params
      params.require(:request).permit(
        :source,
        :destination,
        :num_trucks,
        :service_lvl,
        :reqd_date,
        :poc_src,
        :poc_dest,
        :email_src,
        :email_dest,
        :phone_src,
        :phone_dest,
        :truck_id,
        :shipper_id,
        :load_weight)
    end
    def logged_in
      if admin_signed_in?
      elsif shipper_signed_in?
      elsif carrier_signed_in?
      elsif driver_signed_in?
      else
        redirect_to new_shipper_session_path
      end
    end

    def admin_shipper
      if admin_signed_in?
      elsif shipper_signed_in?
      elsif carrier_signed_in?
        redirect_to carrier_path(current_carrier)
      elsif driver_signed_in?
        redirect_to driver_path(current_driver)
      else
        redirect_to new_shipper_session_path
      end
    end
end
