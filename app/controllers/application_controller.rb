class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  def logged_in_admin
    unless admin_signed_in?
      redirect_to new_admin_session_path
    end
  end

  def logged_in_shipper
    unless shipper_signed_in?
      redirect_to new_shipper_session_path
    end
  end

  def logged_in_carrier
    unless carrier_signed_in?
      redirect_to new_carrier_session_path
    end
  end
end
