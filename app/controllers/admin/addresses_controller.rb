class Admin::AddressesController < ApplicationController
  before_action :require_admin, only: [:index]

  def index
    @users = User.where(admin: false)
  end

  private
  def require_admin
    unless current_user.admin?
      redirect_to root_path
    end
  end
end
