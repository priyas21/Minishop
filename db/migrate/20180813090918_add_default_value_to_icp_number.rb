class AddDefaultValueToIcpNumber < ActiveRecord::Migration[5.2]
  def change
    change_column_default :icps, :number, from: nil, to: "123"
  end
end
