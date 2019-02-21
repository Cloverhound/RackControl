class CreateVmwareDeviceLabs < ActiveRecord::Migration[5.2]
  def change
    create_table :vmware_device_labs do |t|
      t.integer :vmware_device_id
      t.integer :lab_id
      t.string :snapshot_name

      t.timestamps
    end
  end
end
