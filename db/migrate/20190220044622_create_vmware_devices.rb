class CreateVmwareDevices < ActiveRecord::Migration[5.2]
  def change
    create_table :vmware_devices do |t|
      t.string :vm_name
      t.string :datacenter_name
      t.string :vsphere_host
      t.string :username
      t.string :password
      t.string :description

      t.timestamps
    end
  end
end
