class CreateDeviceLabs < ActiveRecord::Migration[5.2]
  def change
    create_table :device_labs do |t|
      t.integer :device_id
      t.integer :lab_id
      t.integer :config_id

      t.timestamps
    end
  end
end
