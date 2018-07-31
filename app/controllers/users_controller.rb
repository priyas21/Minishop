class UsersController < ApplicationController
  def index
    @users = User.all
  end
  end
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "User is created successfully"
      redirect_to @user
    else
      flash[:danger] = "Please enter valid information"
      render 'new'
    end
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :phone, :email)
  end
end
