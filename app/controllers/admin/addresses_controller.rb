class Admin::AddressesController < ApplicationController
  before_action :set_user, only: [:edit, :update]
  before_action :require_admin, only: [:index, :edit, :update]

  def index
    @users = User.where(admin: false)
  end

  def edit

  end

  def update
    if @address.update_attributes(address_params)
      redirect_to admin_address_path(@user)
    else
      render 'edit'
    end
  end

  private
  def require_admin
    unless current_user.admin?
      redirect_to root_path
    end
  end

  def set_user
    @user = User.find(params[:id])
    @address = @user.addresses.find(params[:id])
  end

   def address_params
    params.require(:address).permit(:address1, :address2, :city, :district, :suburb, :post_code, :icp_number, :approval_status)
  end
end
