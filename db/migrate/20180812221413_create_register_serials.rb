class CreateRegisterSerials < ActiveRecord::Migration[5.2]
  def change
    create_table :register_serials do |t|
      t.string :meter_number
      t.string :register_number
      t.string :register_decimals

      t.references :icp, foreign_key: true

      t.timestamps
    end
  end
end
