class AddFieldsToDevice < ActiveRecord::Migration[5.2]
  def change
    add_column :devices, :vmware_device_id, :integer
  end
end
