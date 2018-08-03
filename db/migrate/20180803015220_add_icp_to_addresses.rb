class AddIcpToAddresses < ActiveRecord::Migration[5.2]
  def change
    add_column :addresses, :icp_number, :string
  end
end
