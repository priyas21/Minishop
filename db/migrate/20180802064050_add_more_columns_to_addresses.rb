class AddMoreColumnsToAddresses < ActiveRecord::Migration[5.2]
  def change
    add_column :addresses, :address1, :string
    add_column :addresses, :address2, :string
    add_column :addresses, :city, :string
    add_column :addresses, :district, :string
    add_column :addresses, :suburb, :string
    add_column :addresses, :post_code, :string
  end
end
