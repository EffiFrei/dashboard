class AdminsController < ApplicationController
	def index
		if admin_signed_in?
			@admins = Admin.all
		else
			render "static_pages/home"
		end
	end
end
