class CreateDeviceTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :device_types do |t|
      t.string :name
      t.string :vendor
      t.string :model

      t.timestamps
    end
  end
end
