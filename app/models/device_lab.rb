class DeviceLab < ApplicationRecord
  has_many :devices
  has_many :labs
end
