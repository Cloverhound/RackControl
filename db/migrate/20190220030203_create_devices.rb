class CreateDevices < ActiveRecord::Migration[5.2]
  def change
    create_table :devices do |t|
      t.string :name
      t.string :ip_address
      t.string :username
      t.string :password
      t.string :enable_password
      t.string :transport_type
      t.integer :device_type_id

      t.timestamps
    end
  end
end
