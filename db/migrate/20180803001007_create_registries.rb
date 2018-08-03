class CreateRegistries < ActiveRecord::Migration[5.2]
  def change
    create_table :registries do |t|
      t.string :address
      t.string :icp

      t.timestamps
    end
  end
end
