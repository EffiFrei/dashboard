class AdminsController < ApplicationController
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
	end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_params
      params.require(:admin).permit(:email)
    end
end