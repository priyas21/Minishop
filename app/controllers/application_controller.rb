class ApplicationController < ActionController::Base
  include SessionsHelper
  include AddressesHelper

  private
  def require_admin
    unless current_user.admin?
      redirect_to root_path
    end
  end
end
