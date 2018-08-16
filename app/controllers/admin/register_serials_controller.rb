class Admin::RegisterSerialsController < ApplicationController
  before_action :find_id, only: [:index, :new, :create, :show]

  def index
    @register_serials = @address.icp.register_serials.all
  end

  def new
    @register_serial = RegisterSerial.new
  end

  def create
    @register_serial = @address.icp.register_serials.new(register_params)
    if @register_serial.save
      flash[:success] = "Register serial added successfully"
      redirect_to admin_user_address_icp_register_serial_path(@user, @address, @address.icp, @register_serial)
    else
      render 'new'
    end
  end

  def show
    @register_serial = RegisterSerial.find(params[:id])
  end

  private

  def register_params
    params.require(:register_serial).permit(:meter_number, :register_number, :register_decimals)
  end

  def find_id
    @user = User.find(params[:user_id])
    @address = Address.find(params[:address_id])
  end

end