class AddIndexToAddressAndIcpInRegistry < ActiveRecord::Migration[5.2]
  def change
    add_index :registries, [:address, :icp], unique: true
  end
end
