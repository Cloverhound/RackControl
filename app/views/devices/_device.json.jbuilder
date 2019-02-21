json.extract! device, :id, :name, :ip_address, :username, :password, :enable_password, :transport_type, :device_type_id, :created_at, :updated_at
json.url device_url(device, format: :json)
