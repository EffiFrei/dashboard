class AdminsController < ApplicationController
	def index
		if admin_signed_in?
			@admins = Admin.all
		else
			render "static_pages/home"
		end
	end

	def dashboard
		@admins = Admin.all
		@drivers = Driver.all
    @trucks = Truck.all
    @requests = Request.all
    @shippers = Shipper.all
    @carriers = Carrier.all
	end
end
