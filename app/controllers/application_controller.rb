class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  def logged_in_admin
    if carrier_signed_in?
      redirect_to carrier_path(current_carrier)
    elsif shipper_signed_in?
      redirect_to shipper_path(current_shipper)
    elsif driver_signed_in?
      redirect_to driver_path(current_driver)
    elsif  admin_signed_in?
    else
      redirect_to new_admin_session_path
    end
  end
end
