class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in(@user)
      flash.now[:success] = "User is created successfully"
      redirect_to @user
    else
      flash.now[:danger] = "Please enter correct information"
      render 'new'
    end
  end

    def edit
    end

    def update
      if @user.update_attributes(user_params)
        flash.now[:success] = "Profile Updated"
        redirect_to user_address_path(current_user, current_address)
      else
        render 'edit'
      end
    end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :phone, :email)
  end
end
