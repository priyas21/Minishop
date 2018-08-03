class AddressesController < ApplicationController
  def create
    @user = User.find(params[:user_id])
    @address = @user.addresses.create(address_params)
    if @address.errors.any?
      flash[:notice] = @address.errors.full_messages.to_sentence
    end
    redirect_to user_path(@user)
  end

  private
  def address_params
    params.require(:address).permit(:address1, :address2, :city, :district, :suburb, :post_code)
  end
end
