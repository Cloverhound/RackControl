class Device < ApplicationRecord
  has_many :device_labs
  belongs_to :lab_rack
end
