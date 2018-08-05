module AddressesHelper
  def current_address
    @address ||= current_user.addresses.find_by(user_id: current_user.id)
  end

  def current_address?(address)
    address = current_address
  end
end
