class AddMoreStuff < ActiveRecord::Migration[5.2]
  def change
        add_column :devices, :lab_rack_id, :integer
        add_column :labs, :lab_rack_id, :integer
        add_column :vmware_devices, :lab_rack_id, :integer
  end
end
