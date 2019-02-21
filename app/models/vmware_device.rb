class VmwareDevice < ApplicationRecord
    belongs_to :lab_rack
    has_many :vmware_device_labs
end
