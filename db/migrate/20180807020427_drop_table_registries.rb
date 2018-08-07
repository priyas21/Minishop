class DropTableRegistries < ActiveRecord::Migration[5.2]
  def change
    drop_table :registries
  end
end
