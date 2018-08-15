class Admin::AddressesController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]
  before_action :require_admin, only: [:index, :edit, :update, :destroy]

  def index
    @user = User.find(params[:user_id])
    @addresses = @user.addresses.all
  end

  def show

  end

  def edit

  end

  def update
    if @address.update_attributes(address_params)
      flash[:success] = "Address Updated"
      redirect_to admin_user_address_path(@user)
    else
      flash.now[:danger] = @address.errors.full_messages.to_sentence
      render 'edit'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to admin_addresses_path
  end

  private
  def require_admin
    unless current_user.admin?
      redirect_to root_path
    end
  end

  def set_user
    @user = User.find(params[:user_id])
    @address = @user.addresses.find(params[:id])
  end

   def address_params
    params.require(:address).permit(:address1, :address2, :city, :district, :suburb, :post_code,  :approval_status, icp_attributes: [:number])
  end
end
