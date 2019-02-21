class VmwareDeviceLab < ApplicationRecord
  has_many :vmware_devices
  has_many :labs
end
