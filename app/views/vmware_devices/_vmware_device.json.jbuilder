json.extract! vmware_device, :id, :vm_name, :datacenter_name, :vsphere_host, :username, :password, :description, :created_at, :updated_at
json.url vmware_device_url(vmware_device, format: :json)
