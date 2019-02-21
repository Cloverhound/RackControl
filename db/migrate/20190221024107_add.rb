class Add < ActiveRecord::Migration[5.2]
  def change
    add_column :device_labs, :config_name, :string
  end
end
