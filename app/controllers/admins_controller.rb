class AdminsController < ApplicationController
  before_action :set_admin, only: [:show, :edit, :update, :destroy]
  before_action :logged_in_admin

	def index
		@admins = Admin.all
	end

	def edit
	end

	def show
	end

	def update
    respond_to do |format|
      if current_admin.update(admin_params)
        format.html { redirect_to current_admin, notice: 'admin was successfully updated.' }
        format.json { render :show, status: :ok, location: current_admin }
      else
        format.html { render :edit }
        format.json { render json: current_admin.errors, status: :unprocessable_entity }
      end
    end
  end

	def dashboard
		@admins = Admin.all
		@drivers = Driver.all
    @trucks = Truck.all
    @requests = Request.all
    @shippers = Shipper.all
    @carriers = Shipper.all
	end

  def destroy
    @admin.destroy
    respond_to do |format|
      format.html { redirect_to admins_url, notice: 'Admin was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def update
    respond_to do |format|
      if @admin.update(admin_params)
        format.html { redirect_to @admin, notice: 'Admin was successfully updated.' }
        format.json { render :show, status: :ok, location: @admin }
      else
        format.html { render :edit }
        format.json { render json: @admin.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def set_admin
      @admin = Admin.find(params[:id])
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_params
      params.require(:admin).permit(:name, :phone, :email)
    end
end