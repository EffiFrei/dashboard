class AdminsController < ApplicationController
	def index
		if admin_signed_in?
			@admins = Admin.all
		else
			render "static_pages/home"
		end
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
    current_admins = Admin.all
	end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin
      @admin = Admin.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_params
      params.require(:admin).permit(:email)
    end
end
