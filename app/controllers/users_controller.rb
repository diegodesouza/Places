class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    if @user != current_user
      flash[:alert] = "Access Denied"
      redirect_to listings_path
    end
  end
end
