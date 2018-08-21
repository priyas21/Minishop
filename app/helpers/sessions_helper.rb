module SessionsHelper
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    !current_user.nil? && !current_address.nil?
  end

  def current_address
    @address ||= current_user.addresses.first
  end

end
