class AddApprovalStatusToAddresses < ActiveRecord::Migration[5.2]
  def change
    add_column :addresses, :approval_status, :boolean, default: false
  end
end
