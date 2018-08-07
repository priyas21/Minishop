class Admin::AddressesController < ApplicationController
  before_action :require_admin, only: [:index, :edit]

  def index
    @users = User.where(admin: false)
  end

  def edit

  end

  private
  def require_admin
    unless current_user.admin?
      redirect_to root_path
    end
  end
end
