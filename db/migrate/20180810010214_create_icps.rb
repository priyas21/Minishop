class CreateIcps < ActiveRecord::Migration[5.2]
  def change
    create_table :icps do |t|
      t.string :number

      t.timestamps
    end
    change_table :addresses do |t|
      t.belongs_to :icp, index: true
    end
  end
end
