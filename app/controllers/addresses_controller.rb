class AddressesController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update]
  before_action :correct_address, only: [:edit, :update]

  def index
    @user = User.find(params[:user_id])
    @addresses = @user.addresses.all
  end

  def create
    @user = User.find(params[:user_id])
    @address = @user.addresses.new(address_params)
    if @address.save
      redirect_to user_address_path(@user, @address)
    else
      flash[:danger] = @address.errors.full_messages.to_sentence
      redirect_to user_path(@user)
    end
  end

  def show
    @user = User.find(params[:user_id])
    @address = @user.addresses.find(params[:id])
  end

  def edit
  end

  def update
    if @address.update_attributes(address_params)
      flash[:success] = "Address updated"
      redirect_to user_address_path(@user, @address)
    else
      flash.now[:danger] = @address.errors.full_messages.to_sentence
      render 'edit'
    end
  end

  private
  def address_params
    params.require(:address).permit(:address1, :address2, :city, :district, :suburb, :post_code, icp_attributes: [:number])
  end

  def logged_in_user
    unless logged_in?
      flash[:danger] = "Please log in"
      redirect_to login_path
    end
  end

  def correct_address
    @user = User.find(params[:user_id])
    @address = @user.addresses.find(params[:id])

    redirect_to root_path unless current_address?(@address)
  end
end
