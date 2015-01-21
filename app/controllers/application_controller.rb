class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_filter :authenticate_user!, :except => [:index, :show]
  protect_from_forgery with: :exception

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :profile_photo
    devise_parameter_sanitizer.for(:account_update) << [ :profile_photo, :remove_profile_photo ]
  end

  def authorized
    unless current_user.id == Reservation.find(params[:listing_id]).user
      redirect_to root_path
    end
  end
end
