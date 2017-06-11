class RequestsController < ApplicationController
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
    @request = Request.find(params[:id])
  end

  def show
    @request = Request.find(params[:id])
  end

  def update
    @request = Request.find(params[:id])

    if @request.update(request_params)
      redirect_to @request
    else
      render 'edit'
    end
  end


  def destroy
    @request = Request.find(params[:id])
    @request.destroy

    redirect_to requests_path
  end

  private
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
        :phone_dest)
    end
end
