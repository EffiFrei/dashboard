class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  def logged_in_admin
    unless admin_signed_in?
      redirect_to new_admin_session_path
    end
  end
end
