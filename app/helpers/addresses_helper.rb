module AddressesHelper
  def current_address
    @address ||= current_user.addresses.find_by(user_id: current_user.id)
  end
end
