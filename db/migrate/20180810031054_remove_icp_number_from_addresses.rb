class RemoveIcpNumberFromAddresses < ActiveRecord::Migration[5.2]
  def change
    remove_column :addresses, :icp_number, :string
  end
end
