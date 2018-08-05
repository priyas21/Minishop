class AddressesController < ApplicationController
  def create
    @user = User.find(params[:user_id])
    @address = @user.addresses.create(address_params)
    if @address.errors.any?
      flash[:notice] = @address.errors.full_messages.to_sentence
    end
    redirect_to user_address_path(@user, @address)
  end

  def show
    @user = User.find(params[:user_id])
    @address = @user.addresses.find(params[:id])
  end

  def edit
  end

  def update
    if @address.update_attributes(address_params)
      flash.now[:success] = "Address updated"
      redirect_to user_address_path(@user, @address)
    else
      render 'edit'
    end
  end

  private
  def address_params
    params.require(:address).permit(:address1, :address2, :city, :district, :suburb, :post_code, :icp_number)
  end
  end
end
