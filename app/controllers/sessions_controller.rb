class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user
      log_in(user)
      if current_user.admin?
        redirect_to admin_users_path
      else
        redirect_to user_addresses_path(current_user)
      end
    else
      flash.now[:danger] = "Invalid email addrress."
      render 'new'
    end
  end

  def destroy
    log_out
    flash[:success] = "You are successfully logged out"
    redirect_to root_path
  end
end
